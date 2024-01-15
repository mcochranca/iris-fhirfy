Class dc.jrpereira.fhirfy.api.spec Extends %REST.Spec [ ProcedureBlock ]
{

XData OpenAPI [ MimeType = application/json ]
{
{
  "swagger":"2.0",
  "info":{
    "title":"IRIS FHIRfy",
    "version":"1.0.0"
  },
  "securityDefinitions":{
    "BasicAuth":{
      "type":"basic"
    }
  },
  "security":[
    {
      "BasicAuth":[
      ]
    }
  ],
  "paths":{
    "/analyze-data":{
      "post":{
        "operationId":"analyzeData",
        "summary":"Analyze Data",
        "description":"Analyzes raw data and returns an analysis report.",
        "consumes":[
          "application/json"
        ],
        "produces":[
          "application/json"
        ],
        "parameters":[
          {
            "name":"input",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/AnalysisInput"
            }
          }
        ],
        "responses":{
          "200":{
            "description":"Successful analysis response",
            "schema":{
              "$ref":"#/definitions/AnalysisResponse"
            }
          }
        }
      }
    },
    "/suggest-solution":{
      "post":{
        "operationId":"suggestSolution",
        "summary":"Suggest a solution",
        "description":"Suggest a solution based on the analysis report.",
        "consumes":[
          "application/json"
        ],
        "produces":[
          "application/json"
        ],
        "parameters":[
          {
            "name":"input",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/SolutionSuggestionInput"
            }
          }
        ],
        "responses":{
          "200":{
            "description":"Successful solution suggestion response",
            "schema":{
              "$ref":"#/definitions/SuggestedSolutionResponse"
            }
          }
        }
      }
    },
    "/generate-module":{
      "post":{
        "operationId":"generateModule",
        "summary":"Generates the code for a solution suggestion.",
        "description":"Generates the code for a solution suggestion encapsulated as a ZPM module.",
        "consumes":[
          "application/json"
        ],
        "produces":[
          "application/json"
        ],
        "parameters":[
          {
            "name":"input",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/GenerateModuleRequest"
            }
          }
        ],
        "responses":{
          "200":{
            "description":"Successful solution suggestion response",
            "schema":{
              "$ref":"#/definitions/GenerateModuleResponse"
            }
          }
        }
      }
    }
  },
  "definitions":{
    "AnalysisInput":{
      "type":"object",
      "properties":{
        "rawData":{
          "type":"string"
        }
      },
      "example":{
        "rawData":"Patient ID,Patient Name\n1,Patient 1\n2,Patient 2"
      }
    },
    "AnalysisResponse":{
      "type":"object",
      "properties":{
        "markdownResponse":{
          "type":"string"
        }
      },
      "example":{
        "markdownResponse":"# Analysis Report\n\nThe provided data is a list of patient records, each containing specific information about individual patients."
      }
    },
    "SolutionSuggestionInput":{
      "type":"object",
      "properties":{
        "rawData":{
          "type":"string"
        },
        "analysis":{
          "type":"string"
        }
      },
      "example":{
        "rawData":"Patient ID,Patient Name\n1,Patient 1\n2,Patient 2",
        "analysis":"# Analysis Report\n\nThe provided data is a list of patient records, each containing specific information about individual patients."
      }
    },
    "SuggestedSolutionResponse":{
      "type":"object",
      "properties":{
        "solutionSuggestion":{
          "type":"object",
          "properties":{
            "name":{
              "type":"string"
            },
            "description":{
              "type":"string"
            },
            "subModules":{
              "type":"array",
              "items":{
                "type":"object"
              }
            },
            "pseudoCode":{
              "type":"string"
            }
          }
        }
      },
      "example":{
        "solutionSuggestion":{
          "name":"CSV to HL7 FHIR Converter",
          "description":"This solution converts CSV data with patient information into the HL7 FHIR protocol."
        }
      }
    },
    "GenerateModuleRequest":{
      "type":"object"
    },
    "GenerateModuleResponse":{
      "type":"object"
    }
  }
}
}

}