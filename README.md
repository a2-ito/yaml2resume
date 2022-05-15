# yaml2resume

## はじめに

- yamlからpdfの履歴書を作成します。
- 以下ikasamさんのリポジトリをベースに、フォントも全部1コンテナに閉じ込めてみました。`docker run` のみでpdf出力を実行でき、`git clone も必要ありません。
- フォントは [IPA Font License V1.0](https://github.com/ikasam/docker-yaml_cv/blob/master/fonts/IPA_Font_License_Agreement_v1.0.txt) に従い、再配布という形で同梱しています

https://github.com/ikasam/docker-yaml_cv

## 使い方

### 準備
任意のカレントディレクトリに input.yaml を用意してください。本リポジトリの`input.yaml`をテンプレートとして使ってください。

### 実行
```
docker run -it --name resume -v ${PWD}:/work a2ito/yaml2resume ruby make_cv.rb -i /work/input.yaml -o /work/output.pdf
```

