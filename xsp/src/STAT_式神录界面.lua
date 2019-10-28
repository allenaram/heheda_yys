---------------式神录界面----------------
式神录界面={}

function 式神录界面.to育成界面()
	for i=1,10 do
		if 操作.识别2(标识.式神录界面) then
			break
		elseif i==10 then
			return 执行任务.重新识别()
		end
		mSleep(600*参数.延时倍数)
	end
	sysLog('当前位置：式神录')
	
	if not 参数.式神录界面_界面已设置 then
		sysLog('调整布局')
		操作.点击按钮(按钮.式神录界面_显示设置)
		mSleep(300)
		if 操作.识别2(标识.式神录设置界面) then
			操作.点击按钮(按钮.式神录设置界面_小头像)
			mSleep(1000)
			if not 操作.识别2(标识.式神录设置界面) then
				操作.点击按钮(按钮.式神录界面_显示设置)
				mSleep(300)
			end
			操作.点击按钮(按钮.式神录设置界面_稀有度)
			mSleep(1000)
		else
			式神录界面.to育成界面()
		end
		
		if 参数.狗粮升星_目标 == 'N卡' then
			操作.点击按钮(按钮.式神录界面_N卡)
		else
			操作.点击按钮(按钮.式神录界面_素材)
		end
		mSleep(1000)
		参数.式神录界面_界面已设置 = true
	end
	
	while true do
		local target = 式神录界面.findTarget(参数.狗粮升星_星级)
		if target.x ~= -1 then
			sysLog('选择升星式神')
			操作.点击(target)
			mSleep(666)
			操作.点击按钮(按钮.式神录界面_育成)
			mSleep(888)
			break
		end
		操作.滑动(385, 490, 385, 207, 1000)
		mSleep(888)
		if not 操作.识别2(标识.式神录界面) then
			return 执行任务.重新识别()
		end
	end
	
	return 式神录界面.Next()
end

function 式神录界面.findTarget(star)
	tStarPattern = 
	{
		[2] = 标识.式神录界面_两星,
		[3] = 标识.式神录界面_三星,
		[4] = 标识.式神录界面_四星,
	}
	keepScreen(true)
	while 操作.或识别点击({按钮.真蛇消息关闭按钮,按钮.拒绝邀请按钮},true) do
		mSleep(1000)
	end
	local tAll = 操作.全识别(tStarPattern[star])
	local tEffective = {}
	local tForbidArea = {}
	local tmp
	for _, tmp in pairs(tAll) do
		local isNew = true
		for _, forbidArea in pairs(tForbidArea) do
			if tmp.x >= forbidArea.x1 and tmp.y >= forbidArea.y1 and
			   tmp.x <= forbidArea.x2 and tmp.y <= forbidArea.y2 then
				isNew = false
				break			
			end
		end
		if isNew then
			forbidArea = {x1=tmp.x-20, y1=tmp.y-78, x2=tmp.x+69, y2=tmp.y+14}
			table.insert(tEffective, tmp)
			table.insert(tForbidArea, forbidArea)
		end
	end
	tAll = nil
	tForbidArea = nil
	
	local target = {x = -1, y = -1}
	--local all = {}
	for _, cand in pairs(tEffective) do
		local lockedPattern = {0xdfdfdf,"7|0|0xe2e2df,4|-4|0x4f3d81", 90, cand.x+53, cand.y-74, cand.x+64, cand.y-58}
		local levelMaxPattern = {0xf7bd1c,"-2|3|0xe2b42b,4|7|0xffdb47,-1|-7|0x372215", 80, cand.x-15, cand.y-70, cand.x+1, cand.y-44}
		if not 操作.识别2(lockedPattern) and 操作.识别2(levelMaxPattern) then
			target = cand
			break
			--table.insert(all, cand)
		end
	end
	keepScreen(false)
	return target
end