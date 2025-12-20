#[derive(Debug, PartialEq, Eq, Hash)]
pub enum Technology {
    Flutter,
    Rust,
    JavaScript,
    Maven,
    Gradle,
}

#[derive(Debug)]
pub struct DevProject {
    pub path: String,
    pub technology: Technology,
}

impl DevProject {
    pub fn new(path: String, technology: Technology) -> Self {
        DevProject { path, technology }
    }
}

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
