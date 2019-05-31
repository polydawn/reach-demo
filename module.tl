{
	"imports": {
		"base": "catalog:early.polydawn.io/monolith/busybash:v1:linux-amd64",
	},
	"steps": {
		"main": {
			"operation": {
				"inputs": {
					"/": "base",
				},
				"action": {
					"exec": [
						"/bin/echo", "-e",
						"Hello!  You did it!\n Now proceed into the deeper directories and try `reach emerge` on\n  those modules as well to see cooler and cooler examples."
					]
				}
			}
		}
	}
}
