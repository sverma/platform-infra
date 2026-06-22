package main

documents[doc] {
	is_array(input)
	doc := input[_]
}

documents[doc] {
	not is_array(input)
	doc := input
}

deployment[doc] {
	doc := documents[_]
	doc.apiVersion == "apps/v1"
	doc.kind == "Deployment"
}

container[entry] {
	doc := deployment[_]
	c := doc.spec.template.spec.containers[_]
	entry := {
		"deployment": doc,
		"container": c,
	}
}

contains_value(values, expected) {
	values[_] == expected
}

prod {
	data.gitops.environment == "prod"
}
