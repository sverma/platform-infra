terraform { 
    backend "gcs" { 
        bucket = "platform-tf-state-prod-v1" 
        prefix = "gke-platform" 
    } 
}