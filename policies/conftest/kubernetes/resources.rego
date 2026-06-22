package main

deny[msg] {
	entry := container[_]
	not entry.container.resources.requests.cpu
	msg := sprintf("Deployment %q container %q must define resources.requests.cpu", [entry.deployment.metadata.name, entry.container.name])
}

deny[msg] {
	entry := container[_]
	not entry.container.resources.requests.memory
	msg := sprintf("Deployment %q container %q must define resources.requests.memory", [entry.deployment.metadata.name, entry.container.name])
}

deny[msg] {
	entry := container[_]
	not entry.container.resources.limits.cpu
	msg := sprintf("Deployment %q container %q must define resources.limits.cpu", [entry.deployment.metadata.name, entry.container.name])
}

deny[msg] {
	entry := container[_]
	not entry.container.resources.limits.memory
	msg := sprintf("Deployment %q container %q must define resources.limits.memory", [entry.deployment.metadata.name, entry.container.name])
}
