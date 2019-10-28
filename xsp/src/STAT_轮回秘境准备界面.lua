---------------轮回秘境准备---------------
轮回秘境准备界面={}

function 轮回秘境准备界面.to战斗准备界面()
	for i=1,5 do
		if 操作.识别(标识.轮回秘境准备界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：轮回秘境准备')
	
	操作.点击按钮(按钮.轮回秘境准备界面_挑战)
	mSleep(3000)
	return 轮回秘境准备界面.Next()
	
end