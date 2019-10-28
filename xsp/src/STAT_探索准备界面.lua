---------------探索准备界面---------------
探索准备界面={to探索关卡界面,to探索界面}

function 探索准备界面.to探索关卡界面()
	for i=1,20 do
		if 操作.识别2(标识.探索准备界面) then
			break
		elseif i==10 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：探索章节面板')
	
	参数.探索当前滑屏数=0
	参数.BOSS已挑战=0
	
	if 参数.交叉超鬼王 then
		mSleep(参数.超鬼王识别前等待)
		执行任务.识别超鬼王()
	end
	
	if 参数.交叉犬夜叉 then
		if 操作.识别2(标识.重邀界面_犬夜叉发现) then
			操作.点击按钮(按钮.探索准备界面_关闭按钮)
			mSleep(300)
			return 执行任务.重新识别()
		end
	end
	
	if 参数.交叉年兽 then
		if 操作.识别2(标识.重邀界面_年兽发现) then
			操作.点击按钮(按钮.探索准备界面_关闭按钮)
			mSleep(300)
			return 执行任务.重新识别()
		end
	end
	
	if 参数.探索困难==true then
		操作.点击按钮(按钮.探索准备界面_困难按钮)
	else
		操作.点击按钮(按钮.探索准备界面_普通按钮)
	end
	mSleep(500)
	
	if 参数.探索组队类型=='队长' then
		操作.点击按钮(按钮.探索准备界面_组队按钮)
	else
		操作.点击按钮(按钮.探索准备界面_探索按钮)
	end
	
	mSleep(1500)
	探索准备界面.Next()
end

function 探索准备界面.to探索界面()
	for i=1,5 do
		if 操作.识别2(标识.探索准备界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：探索章节面板')
	操作.点击按钮(按钮.探索准备界面_关闭按钮)
	mSleep(300)
	if not(参数.主任务) then
		return 执行任务.重新识别()
	end
	if 参数.任务=='探索' and 参数.探索组队类型~='队员' then
		--return 探索界面.to探索准备界面()
		return 执行任务.重新识别()
	else 
		return 探索准备界面.Next()
	end
	
end

