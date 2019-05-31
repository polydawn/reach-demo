{
	"imports": {
		"base": "catalog:early.polydawn.io/monolith/busybash:v1:linux-amd64"
	},
	"steps": {
		"main": {
			"operation": {
				"inputs": {
					"/": "base"
				},
				"action": {
					"exec": [
						"/bin/bash", "-c",
						"{ echo 'deterministic message :)'; } | tee /task/log"
					]
				},
				"outputs": {
					"log": "/task/log"
				}
			}
		}
	},
	"exports": {
		"log": "main.log"
	}
}
