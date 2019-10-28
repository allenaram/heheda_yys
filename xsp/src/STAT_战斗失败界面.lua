-------------战斗失败界面--------------
战斗失败界面={退出,to重邀界面,to探索关卡界面,to业原火界面,to个人突破界面,to寮突破界面}

function 战斗失败界面.to重邀界面()
	战斗失败界面.退出()
end

function 战斗失败界面.to大蛇界面()
	战斗失败界面.退出()
end

function 战斗失败界面.to麒麟界面()
	战斗失败界面.退出()
end

function 战斗失败界面.to神兽界面()
	战斗失败界面.退出()
end

function 战斗失败界面.to探索关卡界面()
	战斗失败界面.退出()
end

function 战斗失败界面.to业原火界面()
	战斗失败界面.退出()
end

function 战斗失败界面.to个人突破界面()
	战斗失败界面.退出()
end

function 战斗失败界面.to寮突破界面()
	战斗失败界面.退出()
end

function 战斗失败界面.to超鬼王界面()
	战斗失败界面.退出()
end

function 战斗失败界面.to庭院界面()
	战斗失败界面.退出()
end

function 战斗失败界面.to修罗战场界面()
	战斗失败界面.退出()
end

function 战斗失败界面.to道场（居酒屋）界面()
	战斗失败界面.退出()
end

function 战斗失败界面.to轮回秘境界面()
	战斗失败界面.退出()
end

function 战斗失败界面.退出()
	sysLog('当前位置：战斗失败')
	操作.点击按钮(按钮.战斗失败界面_结算区域)
	mSleep(1500)
	return 战斗失败界面.Next()
end