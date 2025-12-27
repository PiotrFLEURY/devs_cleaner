use axum::{Json, Router, extract::Path, routing::get};

use crate::{
    listing,
    models::{DockerSystemDf, GradleCache, MavenCache, ProjectCollection, PubCache},
};

pub fn create_router() -> Router {
    Router::new()
        .route("/dockerCache", get(get_docker_cache))
        .route("/mavenCache", get(get_maven_cache))
        .route("/gradleCache", get(get_gradle_cache))
        .route("/pubCache", get(get_pub_cache))
        .route("/projects/{path}", get(get_project_list))
        .fallback(get(|| async { "Not Found" }))
}

pub async fn get_docker_cache() -> Json<Vec<DockerSystemDf>> {
    if let Some(caches) = listing::docker_cache() {
        Json(caches)
    } else {
        Json(Vec::new())
    }
}

pub async fn get_maven_cache() -> Json<MavenCache> {
    let maven_cache = listing::maven_cache();
    Json(maven_cache)
}

pub async fn get_gradle_cache() -> Json<GradleCache> {
    let gradle_cache = listing::gradle_cache();
    Json(gradle_cache)
}

pub async fn get_pub_cache() -> Json<PubCache> {
    let pub_cache = listing::pub_cache();
    Json(pub_cache)
}

pub async fn get_project_list(Path(path): Path<String>) -> Json<ProjectCollection> {
    if path.is_empty() {
        return Json(ProjectCollection::new());
    }
    let projects = listing::list_projects(path.as_str());
    Json(projects)
}
