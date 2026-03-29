#[derive(Debug, PartialEq, Eq)]
pub enum CacheType {
    Docker,
    Maven,
    Gradle,
    Pub,
    Npm,
}

impl CacheType {
    pub fn from(s: &Option<String>) -> Option<Self> {
        match s.as_deref() {
            None | Some("all") => None,
            Some("docker") => Some(CacheType::Docker),
            Some("maven") => Some(CacheType::Maven),
            Some("gradle") => Some(CacheType::Gradle),
            Some("pub") => Some(CacheType::Pub),
            Some("npm") => Some(CacheType::Npm),
            Some(value) => {
                eprintln!(
                    "Unknown cache type: '{}'. Valid options are: docker, maven, gradle, pub, npm, all",
                    value
                );
                panic!("Invalid cache type specified");
            }
        }
    }

    pub fn matches(&self, other: &CacheType) -> bool {
        std::mem::discriminant(self) == std::mem::discriminant(other)
    }
}

pub struct DynamicSize {
    pub size_in_bytes: u64,
}

impl DynamicSize {
    pub fn new(size_in_bytes: u64) -> Self {
        DynamicSize { size_in_bytes }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_cache_type_from_none() {
        assert_eq!(CacheType::from(&None), None);
    }

    #[test]
    fn test_cache_type_from_all() {
        assert_eq!(CacheType::from(&Some("all".to_string())), None);
    }

    #[test]
    fn test_cache_type_from_docker() {
        assert_eq!(
            CacheType::from(&Some("docker".to_string())),
            Some(CacheType::Docker)
        );
    }

    #[test]
    fn test_cache_type_from_maven() {
        assert_eq!(
            CacheType::from(&Some("maven".to_string())),
            Some(CacheType::Maven)
        );
    }

    #[test]
    fn test_cache_type_from_gradle() {
        assert_eq!(
            CacheType::from(&Some("gradle".to_string())),
            Some(CacheType::Gradle)
        );
    }

    #[test]
    fn test_cache_type_from_pub() {
        assert_eq!(
            CacheType::from(&Some("pub".to_string())),
            Some(CacheType::Pub)
        );
    }

    #[test]
    fn test_cache_type_from_npm() {
        assert_eq!(
            CacheType::from(&Some("npm".to_string())),
            Some(CacheType::Npm)
        );
    }

    #[test]
    fn test_cache_type_from_unknown() {
        let result = std::panic::catch_unwind(|| {
            CacheType::from(&Some("unknown".to_string()));
        });
        assert!(result.is_err());
    }
}
