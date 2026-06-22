package main

deny[msg] {
	entry := container[_]
	image := entry.container.image
	contains(image, ":latest")
	msg := sprintf("Deployment %q container %q must not use a latest image tag", [entry.deployment.metadata.name, entry.container.name])
}

deny[msg] {
	entry := container[_]
	not entry.container.image
	msg := sprintf("Deployment %q container %q must define an image", [entry.deployment.metadata.name, entry.container.name])
}

deny[msg] {
	prod
	entry := container[_]
	image := entry.container.image
	not regex.match("^.+:[^/@]+@sha256:[0-9a-f]{64}$", image)
	msg := sprintf("Production Deployment %q container %q image must be tag + digest pinned: %q", [entry.deployment.metadata.name, entry.container.name, image])
}

deny[msg] {
	prod
	entry := container[_]
	image := entry.container.image
	not regex.match("^[a-z0-9-]+-docker\\.pkg\\.dev/.+/.+/.+:[^/@]+@sha256:[0-9a-f]{64}$", image)
	msg := sprintf("Production Deployment %q container %q image must come from Artifact Registry and be digest pinned: %q", [entry.deployment.metadata.name, entry.container.name, image])
}
