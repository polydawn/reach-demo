{
	"imports": {
		"base": "catalog:images.polydawn.io/busybash:v1:linux-amd64",
		"src": "ingest:git:.:HEAD"
	},
	"steps": {
		"main": {
			"operation": {
				"inputs": {
					"base": "/",
					"src": "/task/src"
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
