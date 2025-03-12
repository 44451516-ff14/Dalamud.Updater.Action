# 定义 API URL
$apiUrl = "https://api.github.com/repos/AtmoOmen/Dalamud/releases/latest"

# 发送 HTTP 请求获取最新版本信息
$response = Invoke-RestMethod -Uri $apiUrl -Method Get

# 提取 tag_name
$tagName = $response.tag_name

# 定义 RuntimeVersion
$runtimeVersion = "8.0.0"

# 生成 DownloadUrl
$downloadUrl = "https://github.com/AtmoOmen/Dalamud/releases/download/$tagName/latest.7z"

# 创建 JSON 对象
$jsonObject = @{
    AssemblyVersion = $tagName
    RuntimeVersion  = $runtimeVersion
    DownloadUrl     = $downloadUrl
}

# 将 JSON 对象转换为 JSON 字符串
$jsonString = $jsonObject | ConvertTo-Json

# 将 JSON 字符串写入文件
$jsonFilePath = "version_info.json"
$jsonString | Out-File -FilePath $jsonFilePath -Encoding UTF8

Write-Host "JSON 文件已生成: $jsonFilePath"
