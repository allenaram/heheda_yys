----------------觉醒界面-----------------
觉醒界面={to麒麟界面}

function 觉醒界面.to麒麟界面()
	for i=1,5 do
		if 操作.识别2(标识.觉醒界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：觉醒面板')
	
	if 参数.麒麟属性=='火麒麟' then
		操作.点击按钮(按钮.觉醒界面_火麒麟按钮)
	elseif 参数.麒麟属性=='水麒麟' then
		操作.点击按钮(按钮.觉醒界面_水麒麟按钮)
	elseif 参数.麒麟属性=='风麒麟' then
		操作.点击按钮(按钮.觉醒界面_风麒麟按钮)
	elseif 参数.麒麟属性=='雷麒麟' then
		操作.点击按钮(按钮.觉醒界面_雷麒麟按钮)
	end
	mSleep(300)
	return 觉醒界面.Next()
	
end
