#[derive(Debug, PartialEq, Eq, Hash, serde::Deserialize, serde::Serialize)]
pub enum Technology {
    Flutter,
    Rust,
    JavaScript,
    Maven,
    Gradle,
}

#[derive(Debug, serde::Deserialize, serde::Serialize)]
pub struct DevProject {
    pub path: String,
    pub technology: Technology,
    #[serde(rename = "sizeInBytes")]
    pub size_in_bytes: u64,
    #[serde(rename = "hasBuildArtifact")]
    pub has_build_artifact: bool,
}

impl DevProject {
    pub fn new(
        path: String,
        technology: Technology,
        size_in_bytes: u64,
        has_build_artifact: bool,
    ) -> Self {
        DevProject {
            path,
            technology,
            size_in_bytes,
            has_build_artifact,
        }
    }
}

#[derive(Debug, serde::Deserialize, serde::Serialize)]
pub struct ProjectCollection {
    pub projects: Vec<DevProject>,
}

impl ProjectCollection {
    pub fn new() -> Self {
        ProjectCollection {
            projects: Vec::new(),
        }
    }

    pub fn push(&mut self, project: DevProject) {
        self.projects.push(project);
    }

    pub fn len(&self) -> usize {
        self.projects.len()
    }

    pub fn list_distinct_technologies(&self) -> Vec<&Technology> {
        let mut tech_set = std::collections::HashSet::new();
        for project in &self.projects {
            let tech = &project.technology;
            tech_set.insert(tech);
        }
        tech_set.into_iter().collect()
    }

    pub fn count_distinct_technologies(&self) -> usize {
        self.list_distinct_technologies().len()
    }
}

// {\"Active\":\"0\",\"Reclaimable\":\"478.9MB (100%)\",\"Size\":\"478.9MB\",\"TotalCount\":\"1\",\"Type\":\"Images\"}
// {\"Active\":\"0\",\"Reclaimable\":\"0B\",\"Size\":\"0B\",\"TotalCount\":\"0\",\"Type\":\"Containers\"}
// {\"Active\":\"0\",\"Reclaimable\":\"260.5MB (100%)\",\"Size\":\"260.5MB\",\"TotalCount\":\"3\",\"Type\":\"Local Volumes\"}
// {\"Active\":\"0\",\"Reclaimable\":\"0B\",\"Size\":\"0B\",\"TotalCount\":\"0\",\"Type\":\"Build Cache\"}\n"%
#[derive(Debug, serde::Deserialize, serde::Serialize)]
pub struct DockerSystemDf {
    #[serde(rename = "Active")]
    pub active: String,
    #[serde(rename = "Reclaimable")]
    pub reclaimable: String,
    #[serde(rename = "Size")]
    pub size: String,
    #[serde(rename = "TotalCount")]
    pub total_count: String,
    #[serde(rename = "Type")]
    pub dtype: String,
}

#[derive(Debug, serde::Deserialize, serde::Serialize)]
pub struct MavenCache {
    pub path: String,
    #[serde(rename = "totalSizeInBytes")]
    pub total_size_in_bytes: u64,
}

#[derive(Debug, serde::Deserialize, serde::Serialize)]
pub struct GradleCache {
    pub path: String,
    #[serde(rename = "totalSizeInBytes")]
    pub total_size_in_bytes: u64,
}

#[derive(Debug, serde::Deserialize, serde::Serialize)]
pub struct PubCache {
    pub path: String,
    #[serde(rename = "totalSizeInBytes")]
    pub total_size_in_bytes: u64,
}

#[derive(Debug, serde::Deserialize, serde::Serialize)]
pub struct NpmCache {
    pub path: String,
    #[serde(rename = "totalSizeInBytes")]
    pub total_size_in_bytes: u64,
}
