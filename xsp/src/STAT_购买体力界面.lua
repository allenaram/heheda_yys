--------购买体力界面--------
购买体力界面={操作}

function 购买体力界面.操作()
	if not(参数.自动购买体力) then
		操作.点击按钮(按钮.购买体力界面_关闭按钮)
		执行任务.设置结束主任务流程()
		return 执行任务.结束主任务()
	else
		操作.点击按钮(按钮.购买体力界面_购买按钮)
		mSleep(1000)
		操作.点击按钮(按钮.战斗结算界面1_结算区域)
		mSleep(1000)
		return 执行任务.重新识别()
	end
end