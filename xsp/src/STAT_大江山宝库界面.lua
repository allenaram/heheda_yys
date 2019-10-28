------------大江山宝库------------
大江山宝库界面={to大江山之战界面,}

function 大江山宝库界面.to大江山之战界面()
	for i=1,5 do
		if 操作.识别2(标识.大江山宝库界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('误入大江山宝库，即刻返回')
	
	操作.点击按钮(按钮.大江山宝库界面_返回)
	mSleep(666)
	return 大江山之战界面.Next()
end