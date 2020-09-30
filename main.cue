package kube

import (
  "tool/cli"
	"tool/file"
  "encoding/json"
	// "tool/os"
)

cmd_meta: {
  	params: {
    metadata: string @tag(metadata)
	}

  load_metadata: file.Read & {
    filename: params.metadata
    contents: string
  }

  loaded: load_metadata.contents
  test: json.Unmarshal(loaded)

  task: cli.Print & {
    text: json.Marshal(test)
  }
}
command: metadata: cmd_meta

