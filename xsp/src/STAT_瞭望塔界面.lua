---------------瞭望塔---------------
瞭望塔界面={}

function 瞭望塔界面.to轮回秘境界面()
	for i=1,5 do
		if 操作.识别(标识.瞭望塔界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：瞭望塔')
	
	操作.点击按钮(按钮.瞭望塔界面_轮回秘境)
	mSleep(3000)
	return 瞭望塔界面.Next()
	
end