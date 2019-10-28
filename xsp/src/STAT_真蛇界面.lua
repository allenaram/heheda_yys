-------------真蛇界面--------------
真蛇界面={to探索界面}

function 真蛇界面.to探索界面()
	for i=1,5 do
		if 操作.识别2(标识.真蛇界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：真蛇界面')
	
	操作.点击按钮(按钮.真蛇界面_关闭按钮)
	mSleep(300)
	return 真蛇界面.Next()
end

