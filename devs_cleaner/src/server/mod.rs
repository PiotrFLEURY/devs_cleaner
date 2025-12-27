use std::collections::HashMap;

use axum::{
    Json, Router,
    extract::Query,
    routing::{delete, get},
};

use crate::{
    listing,
    models::{DockerSystemDf, GradleCache, MavenCache, ProjectCollection, PubCache},
};

pub fn create_router() -> Router {
    Router::new()
        .route("/dockerCache", get(get_docker_cache))
        .route("/dockerCache", delete(delete_docker_cache))
        .route("/mavenCache", get(get_maven_cache))
        .route("/mavenCache", delete(delete_maven_cache))
        .route("/gradleCache", get(get_gradle_cache))
        .route("/gradleCache", delete(delete_gradle_cache))
        .route("/pubCache", get(get_pub_cache))
        .route("/pubCache", delete(delete_pub_cache))
        .route("/projects/", get(get_project_list))
        .route("/projects", delete(delete_project_build))
        .fallback(get(|| async { "Not Found" }))
}

pub async fn get_docker_cache() -> Json<Vec<DockerSystemDf>> {
    if let Some(caches) = listing::docker_cache() {
        Json(caches)
    } else {
        Json(Vec::new())
    }
}

pub async fn delete_docker_cache() -> Json<bool> {
    let result = listing::delete_docker_cache();
    Json(result)
}

pub async fn get_maven_cache() -> Json<MavenCache> {
    let maven_cache = listing::maven_cache();
    Json(maven_cache)
}

pub async fn delete_maven_cache() -> Json<bool> {
    let result = listing::delete_maven_cache();
    Json(result)
}

pub async fn get_gradle_cache() -> Json<GradleCache> {
    let gradle_cache = listing::gradle_cache();
    Json(gradle_cache)
}

pub async fn delete_gradle_cache() -> Json<bool> {
    let result = listing::delete_gradle_cache();
    Json(result)
}

pub async fn get_pub_cache() -> Json<PubCache> {
    let pub_cache = listing::pub_cache();
    Json(pub_cache)
}

pub async fn get_project_list(
    Query(params): Query<HashMap<String, String>>,
) -> Json<ProjectCollection> {
    let path = match params.get("path") {
        Some(p) => p,
        None => return Json(ProjectCollection::new()),
    };
    let projects = listing::list_projects(path.as_str());
    Json(projects)
}

pub async fn delete_project_build(Query(params): Query<HashMap<String, String>>) -> Json<bool> {
    let path = match params.get("projectPath") {
        Some(p) => p,
        None => return Json(false),
    };
    let result = listing::delete_project_build_artifacts(&path);
    Json(result)
}

pub async fn delete_pub_cache() -> Json<bool> {
    let result = listing::delete_pub_cache();
    Json(result)
}
