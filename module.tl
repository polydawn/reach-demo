{
	"imports": {
		"base": "catalog:early.polydawn.io/monolith/busybash:v1:linux-amd64",
		"src": "ingest:git:.:HEAD"
	},
	"steps": {
		"main": {
			"operation": {
				"inputs": {
					"/": "base",
					"/task/src": "src"
				},
				"action": {
					"exec": [
						"/bin/bash", "-c",
						"{ echo hihi; ls src ;} | tee /task/log"
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
