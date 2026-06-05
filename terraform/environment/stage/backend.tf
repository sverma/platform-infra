terraform { 
    backend "gcs" { 
        bucket = "platform-tf-state-stage" 
        prefix = "gke-platform" 
    } 
}