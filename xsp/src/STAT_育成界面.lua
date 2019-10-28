---------------育成界面----------------
育成界面={}

local tStar = 
{
	[2] = 按钮.育成界面_两星,
	[3] = 按钮.育成界面_三星,
	[4] = 按钮.育成界面_四星,
}
local tType = 
{
	['N卡'] = 按钮.育成界面_N卡,
	['素材'] = 按钮.育成界面_素材,
}
local tStarPattern = 
{
	[2] = 标识.育成界面_两星,
	[3] = 标识.育成界面_三星,
	[4] = 标识.育成界面_四星,
	[5] = 标识.育成界面_五星,
}

function 育成界面.to式神录界面()
	for i=1,10 do
		if 操作.或识别({标识.狗粮升星界面,标识.狗粮升级界面}) then
			break
		elseif i==10 then
			return 执行任务.重新识别()
		end
		mSleep(600*参数.延时倍数)
	end
	sysLog('当前位置：式神育成')
	
	if 操作.识别2(标识.狗粮升级界面) then
		操作.点击按钮(按钮.育成界面_升星)
		mSleep(888)
	end
	
	if not 参数.育成界面_界面已设置 then
		sysLog('调整布局')
		--切换小头像
		if 操作.识别点击(按钮.育成界面_头像切换) then
			mSleep(1000)
		end
		--按星级分类
		操作.点击按钮(按钮.育成界面_显示设置)
		mSleep(888)
		if 操作.识别2(标识.育成设置界面) then
			操作.点击按钮(参数.狗粮升星_材料分类方式 == '按星级查找' and 按钮.育成设置界面_星级 
						or 按钮.育成设置界面_稀有度)
			mSleep(1000)
		else
			执行任务.重新识别()
		end
		参数.育成界面_界面已设置 = true
	end
	if 参数.狗粮升星_材料分类方式 == '按星级查找' then
		--选择目标星级
		操作.点击按钮(tStar[参数.狗粮升星_星级])
	else
		--选择目标类型
		操作.点击按钮(tType[参数.狗粮升星_材料.N卡 and 'N卡' or '素材'])
	end
	mSleep(888)
	
	while true do
		if 育成界面.findTarget(参数.狗粮升星_星级) == 0 then
			mSleep(300)
			break
		end
		操作.滑动(385, 490, 385, 207, 1000)
		mSleep(1000)
	end
	
	操作.点击按钮(按钮.育成界面_确认)
	sysLog('第'..(参数.狗粮升星_次数-参数.狗粮升星_剩余次数+1)..'只升星中...')
	mSleep(300)
	for i = 1, 5 do
		if 操作.或识别({标识.狗粮升星界面_正在升星1, 标识.狗粮升星界面_正在升星2, tStarPattern[参数.狗粮升星_星级+1]}) then
			育成界面.checkTimes()
			操作.点击按钮(按钮.育成界面_返回)
			mSleep(1500)
			return 育成界面.Next()
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(600*参数.延时倍数)
	end
	
	return 星级提升界面.to式神录界面()
end

function 育成界面.to星级提升界面()
	for i=1,10 do
		if 操作.或识别({标识.狗粮升星界面,标识.狗粮升级界面}) then
			break
		elseif i==10 then
			return 执行任务.重新识别()
		end
		mSleep(600*参数.延时倍数)
	end
	sysLog('当前位置：式神育成')
	
	if 操作.识别2(标识.狗粮升级界面) then
		操作.点击按钮(按钮.育成界面_升星)
		mSleep(888)
	end
	
	if 参数.狗粮升星_继续升星 and not 操作.识别2(标识.狗粮升星界面_添加材料) then
		操作.点击按钮(按钮.育成界面_确认)
		sysLog('第'..(参数.狗粮升星_次数-参数.狗粮升星_剩余次数+1)..'只升星中...')
		mSleep(2500)
		return 育成界面.Next()
	end
	
	if not 参数.育成界面_界面已设置 then
		sysLog('调整布局')
		--切换小头像
		if 操作.识别点击(按钮.育成界面_头像切换) then
			mSleep(1000)
		end
		--按星级分类
		操作.点击按钮(按钮.育成界面_显示设置)
		mSleep(888)
		if 操作.识别2(标识.育成设置界面) then
			操作.点击按钮(参数.狗粮升星_材料分类方式 == '按星级查找' and 按钮.育成设置界面_星级 or 按钮.育成设置界面_稀有度)
			mSleep(1000)
		else
			执行任务.重新识别()
		end
		参数.育成界面_界面已设置 = true
	end
	--选择目标星级
	local tStar = 
	{
		[2] = 按钮.育成界面_两星,
		[3] = 按钮.育成界面_三星,
		[4] = 按钮.育成界面_四星,
	}
	操作.点击按钮(tStar[参数.狗粮升星_星级])
	mSleep(888)
	
	while true do
		if 育成界面.findTarget(参数.狗粮升星_星级) == 0 then
			break
		end
		操作.滑动(385, 490, 385, 207, 1000)
		mSleep(888)
		if not 操作.或识别({标识.狗粮升星界面,标识.狗粮升级界面}) then
			return 执行任务.重新识别()
		end
	end
	
	mSleep(300)
	操作.点击按钮(按钮.育成界面_确认)
	sysLog('第'..(参数.狗粮升星_次数-参数.狗粮升星_剩余次数+1)..'只升星中...')
	mSleep(2500)
	return 育成界面.Next()
end


function 育成界面.findTarget(star)
	local cnt = star
	
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
	
	for _, cand in pairs(tEffective) do
		local lockedPattern = {0xdfdfdf,"7|0|0xe2e2df,4|-4|0x4f3d81", 90, cand.x+53, cand.y-74, cand.x+64, cand.y-58}
		local levelMaxPattern = {0xf7bd1c,"-2|3|0xe2b42b,4|7|0xffdb47,-1|-7|0x372215", 80, cand.x-15, cand.y-70, cand.x+1, cand.y-44}
		local candType = 'N卡'
		if cand.y >=240 and not 操作.识别2(lockedPattern) and not 操作.识别2(levelMaxPattern) then
			cardType = 'N卡'
			local tTypePattern = 
			{
				['白蛋'] = {0xffffff,"25|1|0xffffff,-10|23|0x272222,2|32|0x2b2625,22|23|0x2c2525,35|31|0x2a2424", 95, cand.x+8, cand.y-64, cand.x+20, cand.y-54}, 
				['红蛋'] = {0xe14b44,"29|0|0xd23e3a,-11|17|0xe8e1e0,0|27|0xfcfafa,24|17|0xffffff,37|27|0xdacfcd", 95, cand.x+5, cand.y-61, cand.x+19, cand.y-53},
				['蓝蛋'] = {0x5987c1,"25|-1|0x5b8ab9,-1|22|0xe29940,28|22|0xe69e44", 95, cand.x+9, cand.y-63, cand.x+15, cand.y-593},
				['黑蛋'] = {0x323030,"33|1|0x312e2e,-3|23|0xffffff,6|33|0xfdfcfc,27|25|0x343130,32|30|0x242221,26|117|0x272424", 95, cand.x+6, cand.y-63, cand.x+21, cand.y-50},
			}
			for t, pattern in pairs(tTypePattern) do
				if 操作.识别2(pattern) then
					cardType = t
					break
				end
			end
			if 参数.狗粮升星_材料[cardType] then
				操作.点击(cand)
				cnt = cnt - 1
				mSleep(444)
				if cnt == 0 then
					break
				end
			end
		end
	end
	keepScreen(false)
	return cnt
end


function 育成界面.checkTimes()
	参数.狗粮升星_剩余次数 = 参数.狗粮升星_剩余次数-1
	if 参数.狗粮升星_剩余次数 <= 0 then
		if 参数.提示信息 then
			syslog2("任务完成！");
		end
		for var = 1,2 do
			vibrator()
			mSleep(1000)
		end
		lua_exit()
	end
end
