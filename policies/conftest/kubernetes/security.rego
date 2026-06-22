package main

deny[msg] {
	doc := deployment[_]
	not doc.spec.template.spec.securityContext.runAsNonRoot
	msg := sprintf("Deployment %q pod securityContext.runAsNonRoot must be true", [doc.metadata.name])
}

deny[msg] {
	doc := deployment[_]
	doc.spec.template.spec.hostNetwork == true
	msg := sprintf("Deployment %q must not enable hostNetwork", [doc.metadata.name])
}

deny[msg] {
	doc := deployment[_]
	doc.spec.template.spec.hostPID == true
	msg := sprintf("Deployment %q must not enable hostPID", [doc.metadata.name])
}

deny[msg] {
	doc := deployment[_]
	doc.spec.template.spec.hostIPC == true
	msg := sprintf("Deployment %q must not enable hostIPC", [doc.metadata.name])
}

deny[msg] {
	entry := container[_]
	entry.container.securityContext.privileged == true
	msg := sprintf("Deployment %q container %q must not be privileged", [entry.deployment.metadata.name, entry.container.name])
}

deny[msg] {
	entry := container[_]
	not entry.container.securityContext.allowPrivilegeEscalation == false
	msg := sprintf("Deployment %q container %q must set securityContext.allowPrivilegeEscalation=false", [entry.deployment.metadata.name, entry.container.name])
}

deny[msg] {
	entry := container[_]
	not entry.container.securityContext.readOnlyRootFilesystem == true
	msg := sprintf("Deployment %q container %q must set securityContext.readOnlyRootFilesystem=true", [entry.deployment.metadata.name, entry.container.name])
}

deny[msg] {
	entry := container[_]
	drops := entry.container.securityContext.capabilities.drop
	not contains_value(drops, "ALL")
	msg := sprintf("Deployment %q container %q must drop all Linux capabilities", [entry.deployment.metadata.name, entry.container.name])
}
