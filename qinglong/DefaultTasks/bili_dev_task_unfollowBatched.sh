#!/usr/bin/env bash
# new Env("bili批量取关主播[dev先行版]")
# cron 0 12 1 * * bili_dev_task_unfollowBatched.sh

dir_shell=$QL_DIR/shell
. $dir_shell/share.sh

bili_repo="cluom_bilibilitoolpro_test"

echo "repo目录: $dir_repo"
bili_repo_dir="$(find $dir_repo -type d -iname $bili_repo | head -1)"
echo -e "bili仓库目录: $bili_repo_dir\n"

cd $bili_repo_dir
export ENVIRONMENT=Production && \
export Ray_RunTasks=UnfollowBatched && \
dotnet run --project ./src/Ray.BiliBiliTool.Console
