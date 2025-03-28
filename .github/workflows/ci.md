Create a workflow file in the '.github/workflows/build_and_test.yml' using GitHub Actions.

Set the workflow name to 'wf-build-and-test'.

The workflow is triggered on three types of events:

1) Push Events: The workflow will run whenever there is a push to the main branch. Additionally, it only triggers if the changes are within the src or tests directories. This ensures that the workflow only runs when relevant files are modified, optimizing the build and test process.

2) Pull Request Events: Similar to push events, the workflow is triggered when a pull request is made to the main branch. Again, it only triggers if the changes are within the 'models', 'repositories', or tests directories. This helps in verifying that the changes in the pull request do not break the build or tests before merging into the main branch.

3) Workflow Dispatch: This allows the workflow to be triggered manually via the GitHub Actions interface. 

4) Define the job:
- Name the job 'job-build-and-test'.
- Set the runner to windows-latest.
Recommended Actions for the Workflow:
- actions/checkout@v4: To check out the repository.
- actions/setup-dotnet@v3: To set up the .NET environment.
- actions/setup-node@v4: To set up Node.js (if needed for any additional tasks).
- actions/cache@v3: To cache dependencies for faster builds.
- actions/upload-artifact@v3: To upload test results or build artifacts.

