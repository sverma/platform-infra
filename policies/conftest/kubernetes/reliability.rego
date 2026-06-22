package main

deny[msg] {
	entry := container[_]
	not entry.container.readinessProbe
	msg := sprintf("Deployment %q container %q must define a readinessProbe", [entry.deployment.metadata.name, entry.container.name])
}

deny[msg] {
	entry := container[_]
	not entry.container.livenessProbe
	msg := sprintf("Deployment %q container %q must define a livenessProbe", [entry.deployment.metadata.name, entry.container.name])
}

deny[msg] {
	prod
	doc := deployment[_]
	not doc.spec.replicas
	msg := sprintf("Production Deployment %q must define spec.replicas", [doc.metadata.name])
}

deny[msg] {
	prod
	doc := deployment[_]
	doc.spec.replicas < 2
	msg := sprintf("Production Deployment %q must have at least 2 replicas", [doc.metadata.name])
}
