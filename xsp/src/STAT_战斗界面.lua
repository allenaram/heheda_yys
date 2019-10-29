-------------战斗界面--------------
战斗界面={to战斗胜利界面}

function 战斗界面.to战斗胜利界面()
	local N=5
	if 参数.默认邀请队友 or 参数.默认接受邀请 then
		N=10
	end
	
	if 参数.御魂换狗粮 and 参数.任务=='大蛇' and 参数.主任务 and (参数.默认邀请队友 or 参数.默认接受邀请) then
		if not(操作.识别2(标识.战斗界面)) then
			for i=1,10 do
				if 操作.识别2(标识.战斗准备界面) then
					战斗准备界面.满级识别()
					break
				elseif i==10 then
					return 执行任务.重新识别()
				end
				mSleep(300*参数.延时倍数)
			end
		end
	end
	
	for i=1,N do
		if 操作.识别2(标识.战斗界面) then
			break
		elseif i==N then
			return 执行任务.重新识别()
		end
		mSleep(600*参数.延时倍数)
	end
	sysLog('当前位置：战斗中')
	参数.开始等待队友时刻=-1
	
	if 参数.狗粮普攻 and 参数.任务=='探索' and 参数.主任务 then
		mSleep(300)
		战斗界面.狗粮普攻()
	end
	
	if (参数.交叉寮突破 and not(参数.寮突已攻破) and 参数.主任务 and (mTime()-参数.寮突破开始计时时刻)>参数.寮突破间隔) or 
	   (参数.交叉犬夜叉 and 参数.主任务 and (mTime()-参数.犬夜叉开始计时时刻)>1800000) or 
	   (参数.交叉个人突破 and 参数.主任务 and 参数.个人突破穿插依据=='CD冷却后切换' and (mTime()-参数.个人突破开始计时时刻)>参数.个人突破间隔) or 
	   (参数.交叉年兽 and 参数.主任务 and (mTime()-参数.年兽开始计时时刻)>43200000) then
		if 操作.识别点击(按钮.战斗界面_头像齿轮,true) then
			mSleep(300)
			if not(操作.识别2(标识.战斗界面_小纸人)) then
				return 执行任务.重新识别() 
			end
			操作.识别点击(按钮.战斗界面_开关小纸人,true,0,0,0,0,true)
			mSleep(1000)
			while true do
				操作.点击按钮(按钮.战斗界面_退出自动进队切换)
				if not(操作.识别2(标识.战斗界面_小纸人)) then
					break
				end
				mSleep(666)
			end
		end
	end
	
	local 已点怪=false
	local 开局怪未点=true
	local 己方已点 = false
	参数.回目数=0
	while true do
		if 操作.识别2(标识.战斗界面_视角调整按钮) then
			sysLog('视角异常，调整一下~')
			操作.点击按钮(按钮.战斗界面_视角调整按钮)
			mSleep(666)
			操作.点击按钮(按钮.战斗界面_视角调整按钮)
			mSleep(1500)
		else
			if 参数.任务 == '海国退治' and 参数.主任务 and 参数.海归退治_退出分数~=100000000 then
				战斗界面.识别伤害()
			end
			已点怪, 开局怪未点 = 战斗界面.标记(已点怪, 开局怪未点)
			己方已点 = 战斗界面.标记己方(己方已点)
		end
		if (参数.任务=='大蛇' and 参数.御魂点怪 or 参数.任务=='修罗战场' and 参数.修罗战场_点怪) and 参数.主任务 and not(已点怪) then
			mSleep(600)
		else
			mSleep(1500)
		end
		sysLog('战斗中......')
		if not(操作.识别2(标识.战斗界面)) then
			break
		end
	end
	mSleep(888) --战斗结束后有一段动画
	return 战斗界面.Next()
end

function 战斗界面.to战斗退出界面()
	操作.点击按钮(按钮.战斗界面_退出)
	mSleep(666)
	return 战斗退出界面.退出()
end

function 战斗界面.狗粮普攻()
	local ocr, msg = createOCR({
		type = "tesseract",
		path = "res/", 
		lang = "chi",
		psm=6
	})
	
	local function 切换普攻(识别区域,普攻按钮)
		local colorTbl = binarizeImage({
			rect = 识别区域,
			diff = {"0xe8e7e6-0x4f4f4f"}
		})
		code, text = ocr:getText({
			data=colorTbl,
			whitelist = "妖术" 
		})
		if trim(text)=='妖术' then
			操作.点击(普攻按钮)
			if 参数.技能可选 then
				mSleep(200)
				操作.识别点击(按钮.战斗界面_普攻)
				mSleep(200)
			end
		end
	end
	
	if 参数.探索组队类型=='单人' then
		if not 参数.技能可选 then
			keepScreen(true)
		end
		if 参数.狗粮表.左前 then
			切换普攻({747,612,800,632},{x=768,y=588})
		end
		if 参数.狗粮表.中前 then
			切换普攻({846,611,902,633},{x=871,y=590})
		end
		if 参数.狗粮表.右前 then
			切换普攻({947,611,1002,633},{x=970,y=593})
		end
		if not 参数.技能可选 then
			keepScreen(false)
		end
	elseif 参数.探索组队类型=='队长' then
		if not 参数.技能可选 then
			keepScreen(true)
		end
		if 参数.狗粮表.左后 then
			切换普攻({843,609,907,636},{x=870,y=589})
		end
		if 参数.狗粮表.右后 then
			切换普攻({943,609,1005,636},{x=970,y=586})
		end
		if not 参数.技能可选 then
			keepScreen(false)
		end
	elseif 参数.探索组队类型=='队员' then
		if not 参数.技能可选 then
			keepScreen(true)
		end
		if 参数.狗粮表.左前 then
			切换普攻({847,609,900,633},{x=874,y=588})
		end
		if 参数.狗粮表.中前 then
			切换普攻({947,610,1002,634},{x=972,y=592})
		end
		if 参数.狗粮表.右前 then
			切换普攻({1050,610,1101,634},{x=1074,y=592})
		end
		if not 参数.技能可选 then
			keepScreen(false)
		end
	end
end



-- 连点函数 --
local function 连点(连点区域, times)
	times=times or 11
	math.randomseed(tostring(os.time()):reverse():sub(1, 7))
	local N=math.random(times-1,times+1)
	for i=1,N do
		操作.点击按钮(连点区域)
		mSleep(math.random(50,100))
	end
end
-- 有草人点草人，没草人点怪 --
local function ClickEnemyOrBogy
(enemyClicked, enemyNotClickedVeryFirst, enemyRegion, bogyPattern, bogyRegion)
	--@return: enum{true: "怪已点，识别草人", false: "草人已点，等待草人消失"}
	if not(enemyClicked) then
		if enemyNotClickedVeryFirst then 
			--开局需要立即点怪，若不加这段，开局识别两秒才会点
			连点(enemyRegion,5)
			return true
		end
		if not(操作.识别2(bogyPattern)) then
			if not(操作.识别2(标识.战斗界面)) then return 执行任务.重新识别() end
			mSleep(1000)
			if not(操作.识别2(bogyPattern)) then
				if not(操作.识别2(标识.战斗界面)) then return 执行任务.重新识别() end
				mSleep(1000)
				if not(操作.识别2(bogyPattern)) then
					if not(操作.识别2(标识.战斗界面)) then return 执行任务.重新识别() end
					连点(enemyRegion,5)
					return true --两秒未识别草人，点怪并切换状态为已点怪
				end
			end
		else
			return false --维持未点怪状态，等待草人消失
		end
	else
		if 操作.识别2(bogyPattern) then
			连点(bogyRegion,5)
			return false --点击草人，切换状态为未点怪
		else
			return true --维持已点怪状态，等待草人出现
		end
	end
end
-- 点草人 --
local function ClickBogy
(enemyClicked, enemyNotClickedVeryFirst, bogyPattern, bogyRegion)
	--为简化设计，采用与ClickEnemyOrBogy一样的结构，只是不点怪
	if not enemyClicked then
		if enemyNotClickedVeryFirst then
			--连点(按钮.战斗界面_标记超鬼王区域,5)
			return true
		end
		if not(操作.识别2(bogyPattern)) then
			if not(操作.识别2(标识.战斗界面)) then return 执行任务.重新识别() end
			mSleep(1000)
			if not(操作.识别2(bogyPattern)) then
				if not(操作.识别2(标识.战斗界面)) then return 执行任务.重新识别() end
				mSleep(1000)
				if not(操作.识别2(bogyPattern)) then
					if not(操作.识别2(标识.战斗界面)) then return 执行任务.重新识别() end
					--连点(按钮.战斗界面_标记超鬼王区域,5)
					return true
				end
			end
		else
			return false
		end
	else
		if 操作.识别2(bogyPattern) then
			连点(bogyRegion, 5)
			return false
		else
			return true
		end
	end
end


function 战斗界面.标记(已点怪, 开局怪未点)
	if 参数.交叉超鬼王 and 参数.标记超鬼王 and not(参数.主任务) and 参数.超鬼王中 then
		-- 标记BOSS和草人 --
		if 参数.超鬼王点怪方式=='标记BOSS和草人' then
			local enemyClicked = ClickEnemyOrBogy(已点怪, 开局怪未点, 按钮.战斗界面_标记超鬼王区域, 标识.战斗界面_草人血量, 按钮.战斗界面_草人)
			return enemyClicked
		-- 只标记草人 --
		elseif 参数.超鬼王点怪方式=='标记草人' then 
			local enemyClicked = ClickBogy(已点怪, 开局怪未点, 按钮.战斗界面_标记超鬼王区域, 标识.战斗界面_草人血量, 按钮.战斗界面_草人)
			return enemyClicked
		-- 只标记BOSS --	
		elseif not(已点怪) then 
			连点(按钮.战斗界面_标记超鬼王区域)
			return true
		end
	end
	
	if 参数.任务=='大蛇' and 参数.御魂点怪 and 参数.主任务 and not(已点怪) then
		--math.randomseed(tostring(os.time()):reverse():sub(1, 7))
		if 操作.识别2(标识.战斗界面_回目) then
			参数.回目数=参数.回目数+1
		else
			return false
		end
		if 参数.回目数==3 then
			sysLog('三回目')
			--mSleep(math.random(180,200))
			if 参数.御魂点怪三回目=='左' then
				连点(按钮.战斗界面_御魂左怪,7)
				mSleep(666)
				连点(按钮.战斗界面_御魂左怪,4)
			elseif 参数.御魂点怪三回目=='中' then
				连点(按钮.战斗界面_御魂中怪,7)
				mSleep(666)
				连点(按钮.战斗界面_御魂中怪,4)
			elseif 参数.御魂点怪三回目=='右' then
				连点(按钮.战斗界面_御魂右怪,7)
				mSleep(666)
				连点(按钮.战斗界面_御魂右怪,4)
			end
			mSleep(2000)
			return true
		elseif 参数.回目数==2 then
			sysLog('二回目')
			--mSleep(math.random(180,200))
			if 参数.御魂点怪二回目=='左' then
				连点(按钮.战斗界面_御魂左怪,7)
				mSleep(666)
				连点(按钮.战斗界面_御魂左怪,4)
			elseif 参数.御魂点怪二回目=='中' then
				连点(按钮.战斗界面_御魂中怪,7)
				mSleep(666)
				连点(按钮.战斗界面_御魂中怪,4)
			elseif 参数.御魂点怪二回目=='右' then
				连点(按钮.战斗界面_御魂右怪,7)
				mSleep(666)
				连点(按钮.战斗界面_御魂右怪,4)
			end
			mSleep(2000)
		elseif 参数.回目数==1 then
			sysLog('一回目')
			--mSleep(math.random(180,200))
			if 参数.御魂点怪一回目=='左' then
				连点(按钮.战斗界面_御魂左怪,7)
				mSleep(666)
				连点(按钮.战斗界面_御魂左怪,4)
			elseif 参数.御魂点怪一回目=='中' then
				连点(按钮.战斗界面_御魂中怪,7)
				mSleep(666)
				连点(按钮.战斗界面_御魂中怪,4)
			elseif 参数.御魂点怪一回目=='右' then
				连点(按钮.战斗界面_御魂右怪,7)
				mSleep(666)
				连点(按钮.战斗界面_御魂右怪,4)
			end
			mSleep(2000)
		end
		return false
	end
	
	if 参数.任务=='修罗战场' and 参数.修罗战场_点怪 and 参数.主任务 and not(已点怪) then
		--math.randomseed(tostring(os.time()):reverse():sub(1, 7))
		if 操作.识别2(标识.战斗界面_回目) then
			参数.回目数=参数.回目数+1
		else
			return false
		end
		if 参数.回目数==3 then
			sysLog('三回目')
			--mSleep(math.random(180,200))
			if 参数.修罗战场_点怪三回目=='左' then
				连点(按钮.战斗界面_修罗战场左怪,7)
				mSleep(666)
				连点(按钮.战斗界面_修罗战场左怪,4)
			elseif 参数.修罗战场_点怪三回目=='中' then
				连点(按钮.战斗界面_修罗战场中怪,7)
				mSleep(666)
				连点(按钮.战斗界面_修罗战场中怪,4)
			elseif 参数.修罗战场_点怪三回目=='右' then
				连点(按钮.战斗界面_修罗战场右怪,7)
				mSleep(666)
				连点(按钮.战斗界面_修罗战场右怪,4)
			end
			mSleep(2000)
			return true
		elseif 参数.回目数==2 then
			sysLog('二回目')
			--mSleep(math.random(180,200))
			if 参数.修罗战场_点怪二回目=='左' then
				连点(按钮.战斗界面_修罗战场左怪,7)
				mSleep(666)
				连点(按钮.战斗界面_修罗战场左怪,4)
			elseif 参数.修罗战场_点怪二回目=='中' then
				连点(按钮.战斗界面_修罗战场中怪,7)
				mSleep(666)
				连点(按钮.战斗界面_修罗战场中怪,4)
			elseif 参数.修罗战场_点怪二回目=='右' then
				连点(按钮.战斗界面_修罗战场右怪,7)
				mSleep(666)
				连点(按钮.战斗界面_修罗战场右怪,4)
			end
			mSleep(2000)
		elseif 参数.回目数==1 then
			sysLog('一回目')
			--mSleep(math.random(180,200))
			if 参数.修罗战场_点怪一回目=='左' then
				连点(按钮.战斗界面_修罗战场左怪,7)
				mSleep(666)
				连点(按钮.战斗界面_修罗战场左怪,4)
			elseif 参数.修罗战场_点怪一回目=='中' then
				连点(按钮.战斗界面_修罗战场中怪,7)
				mSleep(666)
				连点(按钮.战斗界面_修罗战场中怪,4)
			elseif 参数.修罗战场_点怪一回目=='右' then
				连点(按钮.战斗界面_修罗战场右怪,7)
				mSleep(666)
				连点(按钮.战斗界面_修罗战场右怪,4)
			end
			mSleep(2000)
		end
		return false
	end
	
	if 参数.任务=='海国退治' and 参数.主任务 and 参数.海国退治_标记~=0 and (not 已点怪 or 参数.海国退治_标记=='Boss及草人') then
		-- 标记小怪 --
		if 参数.海国退治_标记 == '小怪' then
			连点(按钮.战斗界面_海国退治小怪)
		-- 标记BOSS --
		elseif 参数.海国退治_标记 == 'Boss' then
			连点(按钮.战斗界面_海国退治大怪)
		-- 标记草人 --
		elseif 参数.海国退治_标记 == '草人' then
			if not(操作.识别2(标识.战斗界面_已点怪)) then
				操作.识别点击(标识.战斗界面_海国退治_草人血量,true,0,0,28,80,true)
			end
			return false
		-- 有草人点草人，没草人点怪 --
		else
			local enemyClicked = 
			ClickEnemyOrBogy(已点怪, 开局怪未点, 按钮.战斗界面_海国退治大怪, 
						标识.战斗界面_海国退治_草人血量, 按钮.战斗界面_海国退治_草人)
			return enemyClicked
		end
		return true
	elseif 参数.任务=='海国退治' and 参数.主任务 then
		return true
	end
	
	if (参数.任务=='离岛之歌' and 参数.主任务 or 参数.交叉离岛 and not(参数.主任务) and 参数.当前副任务=='离岛之歌' ) and 参数.离岛点怪 and (not(已点怪) or 参数.离岛点怪目标=='大怪及草人') then
		-- 标记小怪 --
		if 参数.离岛点怪目标=='小怪' then
			连点(按钮.战斗界面_离岛小怪)
		-- 标记BOSS --
		elseif 参数.离岛点怪目标=='大怪' then
			连点(按钮.战斗界面_离岛大怪)
		-- 有草人点草人，没草人点怪 --
		else
			local enemyClicked = ClickEnemyOrBogy(已点怪, 开局怪未点, 按钮.战斗界面_离岛大怪, 标识.战斗界面_草人血量, 按钮.战斗界面_草人)
			return enemyClicked
		end
		return true
	elseif 参数.任务=='离岛之歌' and 参数.主任务 or 参数.交叉离岛 and not(参数.主任务) and 参数.当前副任务=='离岛之歌'  then
		return true
	end
	
	if 参数.任务=='觉醒' and 参数.觉醒点怪 and 参数.主任务 and not(已点怪) then
		if 参数.觉醒点怪目标=='小怪' then
			连点(按钮.战斗界面_觉醒小怪, 3)
		elseif 参数.觉醒点怪目标=='大怪' then
			连点(按钮.战斗界面_觉醒大怪, 3)
		end
		return true
	elseif 参数.任务=='觉醒' then
		return true
	end
	
	if 参数.任务=='探索' and 参数.探索点怪 and 参数.主任务 and not(已点怪) then
		if 参数.探索点怪目标=='小怪' then
			连点(按钮.战斗界面_探索小怪, 3)
		elseif 参数.探索点怪目标=='大怪' then
			连点(按钮.战斗界面_探索大怪, 3)
		end
		return true
	elseif 参数.任务=='探索' then
		return true
	end
	
	if 参数.任务=='御灵' and 参数.御灵点草人 and 参数.主任务 then
		if not(操作.识别2(标识.战斗界面_已点怪)) then
			操作.识别点击(标识.战斗界面_草人血量（御灵）,true,0,0,33,100,true)
		end
	end
	
	if 参数.任务=='轮回秘境' and 参数.轮回秘境_标记~=nil and 参数.主任务 and not(已点怪) then
		if 参数.轮回秘境_标记=='小怪' then
			连点(按钮.战斗界面_轮回秘境小怪)
		elseif 参数.轮回秘境_标记=='大怪' then
			连点(按钮.战斗界面_轮回秘境大怪)
		end
		return true
	elseif 参数.任务=='轮回秘境' then
		return true
	end
	
	return false
end

function 战斗界面.标记己方(己方已点)
	if 参数.任务=='突破' and 参数.突破方式=='个人突破' and 参数.个人突破标记己方~=0 and 参数.主任务 and not(己方已点) or --主任务个人突破
	   参数.交叉个人突破 and not(参数.主任务) and 参数.当前副任务=='个人突破' and 参数.个人突破标记己方~=0 and not(己方已点) or --副任务个人突破
	   参数.任务=='突破' and 参数.突破方式=='寮突破' and 参数.寮突破标记己方~=0 and 参数.主任务 and not(己方已点) or --主任务寮
	   参数.交叉寮突破 and not(参数.主任务) and 参数.当前副任务=='寮突破' and 参数.寮突破标记己方~=0 and not(己方已点) or --副任务寮突破
	   参数.任务=='修罗战场' and 参数.修罗战场标记己方~=0 and 参数.主任务 and not(己方已点) then

	    if 己方已点 then
			return true
		end
		local tTarget = 
		{
			["1号位"] = 按钮.战斗界面_弧形站位_己方1号位,
			["2号位"] = 按钮.战斗界面_弧形站位_己方2号位,
			["3号位"] = 按钮.战斗界面_弧形站位_己方3号位,
			["4号位"] = 按钮.战斗界面_弧形站位_己方4号位,
			["5号位"] = 按钮.战斗界面_弧形站位_己方5号位,
		}
		mSleep(666)
		local targetQuest
		if 参数.任务 == '突破' and 参数.突破方式 == '个人突破' or
			参数.当前副任务 == '个人突破' and not 参数.主任务 then
			targetQuest = 参数.个人突破标记己方
		elseif 参数.任务 == '突破' and 参数.突破方式 == '寮突破' or 
			参数.当前副任务 == '寮突破' and not 参数.主任务 then
			targetQuest = 参数.寮突破标记己方
		elseif 参数.任务 == '修罗战场' then
			targetQuest = 参数.修罗战场标记己方
		end
		操作.点击按钮(tTarget[targetQuest])
		return true
	end
	
	if 参数.任务=='轮回秘境' and 参数.主任务 and 参数.轮回秘境_标记己方~=0 and not(己方已点) then
		local tTarget = 
		{
			["1号位"] = 按钮.战斗界面_反弧形站位_己方1号位,
			["2号位"] = 按钮.战斗界面_反弧形站位_己方2号位,
			["3号位"] = 按钮.战斗界面_反弧形站位_己方3号位,
			["4号位"] = 按钮.战斗界面_反弧形站位_己方4号位,
			["5号位"] = 按钮.战斗界面_反弧形站位_己方5号位,
		}
		mSleep(666)
		sysLog(参数.轮回秘境_标记己方)
		操作.点击按钮(tTarget[参数.轮回秘境_标记己方])
		return true
	end
	
	if 参数.任务=='大蛇' and 参数.主任务 and 参数.大蛇标记己方~=0 and not(己方已点) then
		local tTarget = 
		{
			["1号位"] = 按钮.战斗界面_一字站位_己方1号位,
			["2号位"] = 按钮.战斗界面_一字站位_己方2号位,
			["3号位"] = 按钮.战斗界面_一字站位_己方3号位,
			["4号位"] = 按钮.战斗界面_一字站位_己方4号位,
			["5号位"] = 按钮.战斗界面_一字站位_己方5号位,
		}
		mSleep(666)
		操作.点击按钮(tTarget[参数.大蛇标记己方])
		return true
	end
	
	if 参数.任务=='业原火' and 参数.主任务 and 参数.业原火标记己方~=0 and not(己方已点) then
		local tTarget = 
		{
			["1号位"] = 按钮.战斗界面_一字站位_己方1号位,
			["2号位"] = 按钮.战斗界面_一字站位_己方2号位,
			["3号位"] = 按钮.战斗界面_一字站位_己方3号位,
			["4号位"] = 按钮.战斗界面_一字站位_己方4号位,
			["5号位"] = 按钮.战斗界面_一字站位_己方5号位,
		}
		mSleep(666)
		操作.点击按钮(tTarget[参数.业原火标记己方])
		return true
	end
	
	if 参数.任务=='探索' and 参数.主任务 and 参数.探索标记己方~=0 and not(己方已点) then
		local tTarget = 
		{
			["左前"] = 按钮.战斗界面_双排站位_左前,
			["中前"] = 按钮.战斗界面_双排站位_中前,
			["右前"] = 按钮.战斗界面_双排站位_右前,
			["左后"] = 按钮.战斗界面_双排站位_左后,
			["右后"] = 按钮.战斗界面_双排站位_右后,
		}
		mSleep(666)
		操作.点击按钮(tTarget[参数.探索标记己方])
		return true
	end
	
	if 参数.任务=='觉醒' and 参数.主任务 and 参数.探索标记己方~=0 and not(己方已点) then
		local tTarget = 
		{
			["左前"] = 按钮.战斗界面_双排站位_左前,
			["中前"] = 按钮.战斗界面_双排站位_中前,
			["右前"] = 按钮.战斗界面_双排站位_右前,
			["左后"] = 按钮.战斗界面_双排站位_左后,
			["右后"] = 按钮.战斗界面_双排站位_右后,
		}
		mSleep(666)
		操作.点击按钮(tTarget[参数.觉醒标记己方])
		return true
	end
	
	if 参数.任务=='海国退治' and 参数.主任务 and 参数.海国退治标记己方~=0 and not(己方已点) then
		local tTarget = 
		{
			["1号位"] = 按钮.战斗界面_海国退治站位_己方1号位,
			["2号位"] = 按钮.战斗界面_海国退治站位_己方2号位,
			["3号位"] = 按钮.战斗界面_海国退治站位_己方3号位,
			["4号位"] = 按钮.战斗界面_海国退治站位_己方4号位,
			["5号位"] = 按钮.战斗界面_海国退治站位_己方5号位,
		}
		mSleep(666)
		操作.点击按钮(tTarget[参数.海国退治标记己方])
		return true
	end
	
	return true
end

function 战斗界面.识别伤害()
	if 参数.海归退治_退出分数 == 10000000 then
		local damage = 操作.字符识别({88,88,260,130}, {"0xffca56-0x3f3f3f"})
		damage = damage == "" and 0 or tonumber(damage)
		sysLog("伤害： "..damage)
		if damage >= 10000000 then
			return 战斗界面.to战斗退出界面()
		end
	else
		local num = 操作.字符识别({98,91,124,126}, {"0xffca56-0x3f3f3f"})
		--sysLog(num)
		if num == 5 then
			return 战斗界面.to战斗退出界面()
		end
	end
end



-------------战斗退出界面--------------
战斗退出界面={}

function 战斗退出界面.退出()
	for i=1,5 do
		if 操作.识别2(标识.战斗退出界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：战斗退出')
	
	操作.点击按钮(按钮.战斗退出界面_确认)
	mSleep(1500)
	return 战斗退出界面.Next()
end

