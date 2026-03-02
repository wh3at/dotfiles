import type { Plugin } from "@opencode-ai/plugin"
import { tmpdir } from "os"
import { randomUUID } from "crypto"
import { unlinkSync, writeFileSync } from "fs"
import { join } from "path"
import { execFileSync } from "child_process"

const MAX_PUSHOVER_MESSAGE = 1024

export const NotificationPlugin: Plugin = async ({ project, directory, client }) => {
  return {
    event: async ({ event }) => {
      if (event.type !== "session.idle") return

      const tokenValue = "pass://CLI/pushover-opencode/token"
      const userValue = "pass://CLI/pushover-opencode/user"

      const projectName = project.name ?? directory.split("/").pop() ?? "Unknown"
      const sessionId = event.properties.sessionID

      let title = `✅ ${projectName}`
      let message = `📊 セッション完了`

      try {
        const session = await client.session.get({ sessionID: sessionId, directory })
        const summary = session.summary
        const changedFiles = summary?.diffs?.map(d => d.file) ?? []

        title = `✅ ${session.title || projectName}`

        if (summary) {
          message = `📊 +${summary.additions} -${summary.deletions} 行 (${summary.files}ファイル)`
        }

        if (changedFiles.length > 0) {
          const maxFiles = 10
          const files = changedFiles.slice(0, maxFiles)
          const fileList = files.map(f => `• ${f}`).join('\n')
          const more = changedFiles.length > maxFiles ? `\n  ...他 ${changedFiles.length - maxFiles}件` : ''
          message += `\n\n📝 変更ファイル:\n${fileList}${more}`
        }
      } catch {
        message += `\n📊 セッション完了`
      }

      const truncatedMessage = message.length > MAX_PUSHOVER_MESSAGE
        ? `${message.slice(0, MAX_PUSHOVER_MESSAGE - 1)}…`
        : message

      const tmpEnvFile = join(tmpdir(), `pass-cli-notify-${randomUUID()}.env`)

      try {
        writeFileSync(tmpEnvFile, `PUSHOVER_TOKEN=${tokenValue}\nPUSHOVER_USER=${userValue}\n`, { mode: 0o600 })

        execFileSync("pass-cli", [
          "run",
          "--env-file", tmpEnvFile,
          "--",
          "sh", "-c",
          'curl -sS --fail -o /dev/null --form-string "token=$PUSHOVER_TOKEN" --form-string "user=$PUSHOVER_USER" --form-string "title=$1" --form-string "message=$2" https://api.pushover.net/1/messages.json',
          "sh",
          title,
          truncatedMessage,
        ], {
          timeout: 10000,
          stdio: ["ignore", "ignore", "pipe"],
        })
      } finally {
        try { unlinkSync(tmpEnvFile) } catch {}
      }
    },
  }
}

export default NotificationPlugin
