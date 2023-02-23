@Library('ckt-libraries')
import static git.Github.*
import static checks.SonarQube.*
import static docker.Docker.*

node('sre-slave') {

    ansiColor('xterm') {
        final String REGEX_FILTER = '^((false (opened|reopened|synchronize))|(true (closed)))? (develop|master|main)?$'
        triggers.setGenericTriggerConfiguration(this, repo_name, REGEX_FILTER)

        final String CI_DOCKER_TARGET_STAGE = "builder"
        final String DEFAULT_DOCKERFILE = "Dockerfile"
        final List vulnerabilities_type = ["CRITICAL"]
        String target_branch = action == "closed" ? base_branch : head_branch
        currentBuild.displayName = "${BUILD_NUMBER} - ${repo_name} - ${target_branch}"

        try {
            notifyPRStatus(this, env.GITHUB_TOKEN_CREDENTIAL_ID, "pending", statuses_url, "${BUILD_URL}")
            stage("Checkout") {
                git(url: clone_url, branch: target_branch, credentialsId: env.GITHUB_SSH_CREDENTIAL_ID)
            }

            stage('Docker Build') {
                buildDockerImage(this, repo_name, env.GITHUB_SSH_CREDENTIAL_ID, DEFAULT_DOCKERFILE, CI_DOCKER_TARGET_STAGE)
            }
            stage('validate') {
                 runCommand(this, repo_name, "openapi-generator-cli validate -i api.yaml")
            }
            stage('dummy generator') {
                 runCommand(this, repo_name, "openapi-generator-cli generate -i api.yml -g openapi-yaml")
            }
           
            notifyPRStatus(this, env.GITHUB_TOKEN_CREDENTIAL_ID, "success", statuses_url, "${BUILD_URL}")
        } catch (Exception e) {
            currentBuild.result = 'FAILURE'
            echo "Exception: ${e}"
            notifyPRStatus(this, env.GITHUB_TOKEN_CREDENTIAL_ID, "failure", statuses_url, "${BUILD_URL}")
        } finally {
            downDockerCompose(this, "docker-compose.ci.yml", BUILD_NUMBER)
            cleanWs()
        }
    }
}
