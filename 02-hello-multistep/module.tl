{
	"imports": {
		"base": "catalog:early.polydawn.io/monolith/busybash:v1:linux-amd64"
	},
	"steps": {
		"one": {
			"operation": {
				"inputs": {
					"/": "base"
				},
				"action": {
					"exec": [
						"/bin/bash", "-c",
						"{ echo 'deterministic'; } | tee /task/log"
					]
				},
				"outputs": {
					"pass": "/task"
				}
			}
		},
		"two": {
			"operation": {
				"inputs": {
					"/": "base"
					"/task": "one.pass"
				},
				"action": {
					"exec": [
						"/bin/bash", "-c",
						"{ echo 'message'; } | tee -a /task/log"
					]
				},
				"outputs": {
					"pass": "/task"
				}
			}
		},
		"three": {
			"operation": {
				"inputs": {
					"/": "base"
					"/task": "two.pass"
				},
				"action": {
					"exec": [
						"/bin/bash", "-c",
						"{ echo ':)'; } >> /task/log; cat /task/log"
					]
				},
				"outputs": {
					"pass": "/task"
				}
			}
		}
	},
	"exports": {
		"result": "three.pass"
	}
}
