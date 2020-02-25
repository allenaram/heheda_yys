-------------超鬼王界面--------------
超鬼王界面={to战斗准备界面,探索界面}

function 超鬼王界面.to战斗准备界面()
	for i=1,10 do
		if 操作.识别2(标识.超鬼王界面) then
			break
		elseif i==10 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：超鬼王界面')
	
	keepScreen(true)
	
	if 操作.或识别点击({按钮.真蛇消息关闭按钮,按钮.拒绝邀请按钮},true,0,0,0,0,false) then
		mSleep(666)
		keepScreen(false)
		return 超鬼王界面.to战斗准备界面()
	end

	local 鬼王星级=0
	local 当前血线=100
	mSleep(888)
	
	--检查自己发现的
	if 操作.识别2(标识.超鬼王界面_自己发现标识) then
		for i=1,1 do
			if 操作.或识别({标识.超鬼王界面_六星超鬼王（位置1）,标识.超鬼王界面_六星妖灵超鬼王（位置1）}, false) then
				鬼王星级=6
				break
			end
			if 操作.或识别({标识.超鬼王界面_五星超鬼王（位置1）,标识.超鬼王界面_五星妖灵超鬼王（位置1）}, false) then
				鬼王星级=5
				break
			end
			if 操作.或识别({标识.超鬼王界面_四星超鬼王（位置1）,标识.超鬼王界面_四星妖灵超鬼王（位置1）}, false) then
				鬼王星级=4
				break
			end
			if 操作.或识别({标识.超鬼王界面_三星超鬼王（位置1）,标识.超鬼王界面_三星妖灵超鬼王（位置1）}, false) then
				鬼王星级=3
				break
			end
			if 操作.或识别({标识.超鬼王界面_二星超鬼王（位置1）,标识.超鬼王界面_二星妖灵超鬼王（位置1）}, false) then
				鬼王星级=2
				break
			end
			if 操作.或识别({标识.超鬼王界面_一星超鬼王（位置1）,标识.超鬼王界面_一星妖灵超鬼王（位置1）}, false) then
				鬼王星级=1
				break
			end
		end
	end
	keepScreen(false)
	
	if 鬼王星级>0 then
		操作.点击按钮(按钮.超鬼王界面_超鬼王1)
		sysLog('选中自己发现的超鬼王')
		mSleep(1500)
		if not(操作.识别2(标识.超鬼王界面_挑战按钮)) then
			sysLog('已失效！')
			if 参数.超鬼王只打自己发现的 then
				sysLog('没有可挑战的超鬼王')
				return 超鬼王界面.to探索界面()
			else
				鬼王星级=0
			end
		end
		
		local 攻打自己发现的=false
		if 鬼王星级>=参数.自己发现的超鬼王最低打几星 and 鬼王星级<=参数.自己发现的超鬼王最高打几星 then
			攻打自己发现的=true
			当前血线=超鬼王界面.血线识别({134,282,400,301})
		end
		
		--邀请
		if (鬼王星级==6 and ((攻打自己发现的 and 参数.六星超鬼王邀请 and 当前血线>=参数.六星超鬼王邀请血量下限 and 当前血线<=参数.六星超鬼王邀请血量上限) or not(攻打自己发现的))) then
			操作.点击按钮(按钮.超鬼王界面_集结按钮)
			mSleep(300)
			超鬼王邀请界面.邀请(参数.六星超鬼王邀请目标)
		end
		if (鬼王星级==5 and ((攻打自己发现的 and 参数.五星超鬼王邀请 and 当前血线>=参数.五星超鬼王邀请血量下限 and 当前血线<=参数.五星超鬼王邀请血量上限) or not(攻打自己发现的))) then
			操作.点击按钮(按钮.超鬼王界面_集结按钮)
			mSleep(300)
			超鬼王邀请界面.邀请(参数.五星超鬼王邀请目标)
		end
		if (鬼王星级==4 and ((攻打自己发现的 and 参数.四星超鬼王邀请 and 当前血线>=参数.四星超鬼王邀请血量下限 and 当前血线<=参数.四星超鬼王邀请血量上限) or not(攻打自己发现的))) then
			操作.点击按钮(按钮.超鬼王界面_集结按钮)
			mSleep(300)
			超鬼王邀请界面.邀请(参数.四星超鬼王邀请目标)
		end
		if (鬼王星级==3 and ((攻打自己发现的 and 参数.三星超鬼王邀请 and 当前血线>=参数.三星超鬼王邀请血量下限 and 当前血线<=参数.三星超鬼王邀请血量上限) or not(攻打自己发现的))) then
			操作.点击按钮(按钮.超鬼王界面_集结按钮)
			mSleep(300)
			超鬼王邀请界面.邀请(参数.三星超鬼王邀请目标)
		end
		if (鬼王星级==2 and ((攻打自己发现的 and 参数.二星超鬼王邀请 and 当前血线>=参数.二星超鬼王邀请血量下限 and 当前血线<=参数.二星超鬼王邀请血量上限) or not(攻打自己发现的))) then
			操作.点击按钮(按钮.超鬼王界面_集结按钮)
			mSleep(300)
			超鬼王邀请界面.邀请(参数.二星超鬼王邀请目标)
		end
		if (鬼王星级==1 and ((攻打自己发现的 and 参数.一星超鬼王邀请 and 当前血线>=参数.一星超鬼王邀请血量下限 and 当前血线<=参数.一星超鬼王邀请血量上限) or not(攻打自己发现的))) then
			操作.点击按钮(按钮.超鬼王界面_集结按钮)
			mSleep(300)
			超鬼王邀请界面.邀请(参数.一星超鬼王邀请目标)
		end
		
		--sysLog(string.format('%d',鬼王星级))
		
		if not(攻打自己发现的) or 当前血线<=参数.自己发现的超鬼王攻打血线 then
			鬼王星级=0
		end
		
	elseif 操作.或识别点击({按钮.真蛇消息关闭按钮,按钮.拒绝邀请按钮},true) then
		mSleep(666)
		return 超鬼王界面.to战斗准备界面()
	end

	--检查别人发现的
	if not(参数.超鬼王只打自己发现的) and 鬼王星级==0 then
		--选怪函数
		local function 选择超鬼王(星级,星级标识,page)
			local 超鬼王={}
			超鬼王 = 操作.全识别(星级标识)
			if #超鬼王==0 then
				return 0
			end
			
			for i=1,#超鬼王 do
				if i==1 or i>1 and math.abs(超鬼王[i].y-超鬼王[i-1].y) >= 90*参数.设备高/640 then
					local 好友邀请的=true
					if 超鬼王[i].y <= 272*参数.设备高/640 then
						if 操作.识别2(标识.超鬼王界面_自己发现标识) then
							好友邀请的=false
						end
					end
					
					for j = 1,1 do --用于continue
						if 好友邀请的 then
							if 参数.超鬼王_不打公开 then
								local 已公开图案 = {0x343130,"1|2|0x2a2724,4|3|0x2f2d2a", 93, 391, 超鬼王[i].y-18, 431, 超鬼王[i].y+6}
								local 即将公开图案 = {0x463e3f,"0|4|0x766e78,0|7|0x3d3231", 93, 324, 超鬼王[i].y-18, 370, 超鬼王[i].y+6}
								if 操作.识别2(已公开图案) and not 操作.识别2(即将公开图案) then
									break
								end
							end
							操作.点击(超鬼王[i])
							mSleep(666)
							if 操作.识别2(标识.超鬼王界面_挑战按钮) then--todo
								--todo
								local 选中框左上角={x=-1,y=-1}
								while true do
									选中框左上角=操作.识别(标识.超鬼王界面_选中框左上角)
									if 选中框左上角.y==-1 then
										local 选中框右下角={x=-1,y=-1}
										选中框右下角=操作.识别(标识.超鬼王界面_选中框右下角)
										if 选中框右下角.y==-1 then
											执行任务.重新识别()
										else
											当前血线=超鬼王界面.血线识别({134,选中框右下角.y-25,400,选中框右下角.y-7})
											break
										end
									elseif 选中框左上角.y >= 450  then		
										--向上拉一点点
										操作.滑动(437,508,396,443)
										mSleep(800)
									else
										当前血线=超鬼王界面.血线识别({134,选中框左上角.y+89,400,选中框左上角.y+107}) 
										--当前血线=超鬼王界面.血线识别({188,440,368,457})
										break
									end
								end
								--
								if 当前血线>参数.好友邀请的超鬼王攻打血线 then
									return 星级
								end
							end
						end
					end
				end
			end
			return 0
		end
	
		for i=1,5 do
			if (6>=参数.好友邀请的超鬼王最低打几星 and 6<=参数.好友邀请的超鬼王最高打几星) then 
				鬼王星级=选择超鬼王(6,标识.超鬼王界面_六星超鬼王,i)
				if 鬼王星级==0 then
					鬼王星级=选择超鬼王(6,标识.超鬼王界面_六星妖灵超鬼王,i)
				end
				if 鬼王星级>0 then break end
			end
			if (5>=参数.好友邀请的超鬼王最低打几星 and 5<=参数.好友邀请的超鬼王最高打几星) then 
				鬼王星级=选择超鬼王(5,标识.超鬼王界面_五星超鬼王,i)
				if 鬼王星级==0 then
					鬼王星级=选择超鬼王(6,标识.超鬼王界面_五星妖灵超鬼王,i)
				end
				if 鬼王星级>0 then break end
			end
			if (4>=参数.好友邀请的超鬼王最低打几星 and 4<=参数.好友邀请的超鬼王最高打几星) then 
				鬼王星级=选择超鬼王(4,标识.超鬼王界面_四星超鬼王,i)
				if 鬼王星级==0 then
					鬼王星级=选择超鬼王(6,标识.超鬼王界面_四星妖灵超鬼王,i)
				end
				if 鬼王星级>0 then break end
			end
			if (3>=参数.好友邀请的超鬼王最低打几星 and 3<=参数.好友邀请的超鬼王最高打几星) then 
				鬼王星级=选择超鬼王(3,标识.超鬼王界面_三星超鬼王,i)
				if 鬼王星级==0 then
					鬼王星级=选择超鬼王(6,标识.超鬼王界面_三星妖灵超鬼王,i)
				end
				if 鬼王星级>0 then break end
			end
			if (2>=参数.好友邀请的超鬼王最低打几星 and 2<=参数.好友邀请的超鬼王最高打几星) then 
				鬼王星级=选择超鬼王(2,标识.超鬼王界面_二星超鬼王,i)
				if 鬼王星级==0 then
					鬼王星级=选择超鬼王(6,标识.超鬼王界面_二星妖灵超鬼王,i)
				end
				if 鬼王星级>0 then break end
			end
			if (1>=参数.好友邀请的超鬼王最低打几星 and 1<=参数.好友邀请的超鬼王最高打几星) then 
				鬼王星级=选择超鬼王(1,标识.超鬼王界面_一星超鬼王,i)
				if 鬼王星级==0 then
					鬼王星级=选择超鬼王(6,标识.超鬼王界面_一星妖灵超鬼王,i)
				end
				if 鬼王星级>0 then break end
			end
			if 操作.或识别点击({按钮.真蛇消息关闭按钮,按钮.拒绝邀请按钮},true) then
				mSleep(666)
				return 超鬼王界面.to战斗准备界面()
			end
			if 操作.识别2(标识.超鬼王界面_无更多超鬼王) then break end
			if 操作.识别2(标识.超鬼王界面_无超鬼王) then break end
			if i==5 then break end
			操作.滑动(415,469,396,417)
			mSleep(1000)
		end
	end

	if 鬼王星级==0 then
		while 参数.超鬼王等待疲劳度恢复中 do
			local ocr, msg = createOCR({type = "tesseract", })
			local colorTbl = binarizeImage({
				rect = {928,17,964,35},
				diff = {"0xdfd8c5-0x4f4f4f"}
			})
			local code, text = ocr:getText({
				data=colorTbl,
				whitelist = "0123456789" 
			})
			if trim(text)=='' then
				sysLog('等待疲劳值恢复')
				text=nil				
				mSleep(30000)
			elseif tonumber(trim(text))<=参数.超鬼王返回主任务疲劳值 then
				sysLog('疲劳值恢复完毕！')
				参数.超鬼王等待疲劳度恢复中=false
				ocr:release()
				操作.点击按钮(按钮.超鬼王界面_退出按钮)
				mSleep(1000)
				return 探索界面.to超鬼王界面()
			else 
				sysLog('等待疲劳值恢复')
				mSleep(30000)
				操作.点击按钮(按钮.超鬼王界面_退出按钮)
				mSleep(1000)
				return 探索界面.to超鬼王界面()
			end
			
		end
		sysLog('没有符合要求的超鬼王')
		return 超鬼王界面.to探索界面()
	end
	
	--震动提醒
	if 鬼王星级==4 and 参数.超鬼王震动提醒.四星震动提醒 then
		for i=5,1,-1 do
			vibrator()
			toast(string.format('发现四星，%d秒后将自动挑战！',i));
			mSleep(1000)
		end
		mSleep(3000)
	end
	if 鬼王星级==5 and 参数.超鬼王震动提醒.五星震动提醒 then
		for i=5,1,-1 do
			vibrator()
			toast(string.format('发现五星，%d秒后将自动挑战！',i));
			mSleep(1000)
		end
		mSleep(3000)
	end
	if 鬼王星级==6 and 参数.超鬼王震动提醒.六星震动提醒 then
		for i=5,1,-1 do
			vibrator()
			toast(string.format('发现六星，%d秒后将自动挑战！',i));
			mSleep(1000)
		end
		mSleep(3000)
	end
	
	--切换阵容
	if 鬼王星级==6 then
		if 当前血线<=参数.超鬼王切换阵容血线.六星 then
			参数.切换阵容=参数.超鬼王阵容.六星二队
		else
			参数.切换阵容=参数.超鬼王阵容.六星一队
		end
	elseif 鬼王星级==5 then
		if 当前血线<=参数.超鬼王切换阵容血线.五星 then
			参数.切换阵容=参数.超鬼王阵容.五星二队
		else
			参数.切换阵容=参数.超鬼王阵容.五星一队
		end
	elseif 鬼王星级==4 then
		if 当前血线<=参数.超鬼王切换阵容血线.四星 then
			参数.切换阵容=参数.超鬼王阵容.四星二队
		else
			参数.切换阵容=参数.超鬼王阵容.四星一队
		end
	elseif 鬼王星级==3 then
		if 当前血线<=参数.超鬼王切换阵容血线.三星 then
			参数.切换阵容=参数.超鬼王阵容.三星二队
		else
			参数.切换阵容=参数.超鬼王阵容.三星一队
		end
	elseif 鬼王星级==2 then
		if 当前血线<=参数.超鬼王切换阵容血线.二星 then
			参数.切换阵容=参数.超鬼王阵容.二星二队
		else
			参数.切换阵容=参数.超鬼王阵容.二星一队
		end
	elseif 鬼王星级==1 then
		if 当前血线<=参数.超鬼王切换阵容血线.一星 then
			参数.切换阵容=参数.超鬼王阵容.一星二队
		else
			参数.切换阵容=参数.超鬼王阵容.一星一队
		end
	end

	--是否追击
	if 鬼王星级==6 then
		if 参数.六星超鬼王强力追击 and 当前血线>=参数.六星超鬼王强力追击血量下限 and 当前血线<=参数.六星超鬼王强力追击血量上限 then
			操作.点击按钮(按钮.超鬼王界面_强力追击按钮)
		else
			操作.点击按钮(按钮.超鬼王界面_普通追击按钮)
		end
	end
	if 鬼王星级==5 then
		if 参数.五星超鬼王强力追击 and 当前血线>=参数.五星超鬼王强力追击血量下限 and 当前血线<=参数.五星超鬼王强力追击血量上限 then
			操作.点击按钮(按钮.超鬼王界面_强力追击按钮)
		else
			操作.点击按钮(按钮.超鬼王界面_普通追击按钮)
		end
	end
	if 鬼王星级==4 then
		if 参数.四星超鬼王强力追击 and 当前血线>=参数.四星超鬼王强力追击血量下限 and 当前血线<=参数.四星超鬼王强力追击血量上限 then
			操作.点击按钮(按钮.超鬼王界面_强力追击按钮)
		else
			操作.点击按钮(按钮.超鬼王界面_普通追击按钮)
		end
	end
	if 鬼王星级==3 then
		if 参数.三星超鬼王强力追击 and 当前血线>=参数.三星超鬼王强力追击血量下限 and 当前血线<=参数.三星超鬼王强力追击血量上限 then
			操作.点击按钮(按钮.超鬼王界面_强力追击按钮)
		else
			操作.点击按钮(按钮.超鬼王界面_普通追击按钮)
		end
	end
	if 鬼王星级==2 then
		if 参数.二星超鬼王强力追击 and 当前血线>=参数.二星超鬼王强力追击血量下限 and 当前血线<=参数.二星超鬼王强力追击血量上限 then
			操作.点击按钮(按钮.超鬼王界面_强力追击按钮)
		else
			操作.点击按钮(按钮.超鬼王界面_普通追击按钮)
		end
	end
	if 鬼王星级==1 then
		if 参数.一星超鬼王强力追击 and 当前血线>=参数.一星超鬼王强力追击血量下限 and 当前血线<=参数.一星超鬼王强力追击血量上限 then
			操作.点击按钮(按钮.超鬼王界面_强力追击按钮)
		else
			操作.点击按钮(按钮.超鬼王界面_普通追击按钮)
		end
	end
	mSleep(666)
--	sysLog(string.format('%d',当前血线))
--	sysLog(string.format('%d',参数.超鬼王攻打血线))
--	if 当前血线<=参数.超鬼王攻打血线 then
--		return 超鬼王界面.to探索界面()
--	end

	sysLog(string.format('挑战%d星超鬼王',鬼王星级))
	操作.点击按钮(按钮.超鬼王界面_挑战按钮)
	mSleep(500)
	if 操作.识别2(标识.超鬼王买疲劳度界面) then
		--疲劳度已满
		sysLog('疲劳度已满！')
		if 参数.超鬼王疲劳值满后=='自动购买' then
			sysLog('购买疲劳度')
			操作.点击按钮(按钮.超鬼王买疲劳度界面_购买按钮)
			mSleep(888)
			操作.点击按钮(按钮.超鬼王界面_挑战按钮)
		elseif 参数.超鬼王疲劳值满后=='震动提醒' then
			while true do
				vibrator()
				syslog2('疲劳值已满！');
				mSleep(3000)
			end
		elseif 参数.超鬼王疲劳值满后=='直接返回主任务' then
			操作.点击按钮(按钮.超鬼王买疲劳度界面_退出按钮)
			mSleep(2000)
			return 超鬼王界面.to探索界面()
		else 
			参数.超鬼王等待疲劳度恢复中=true
			操作.点击按钮(按钮.超鬼王买疲劳度界面_退出按钮)
			mSleep(2000)
			--识别疲劳值
			local ocr, msg = createOCR({type = "tesseract", })
			while true do
				local colorTbl = binarizeImage({
					rect = {928,17,964,35},
					diff = {"0xdfd8c5-0x4f4f4f"}
				})
				local code, text = ocr:getText({
					data=colorTbl,
					whitelist = "0123456789" 
				})
				if trim(text)~='' then
					ocr:release()
					return 超鬼王界面.to战斗准备界面()
				end
				sysLog('等待疲劳值恢复')
				text=nil
				mSleep(10000)
			end
			
		end
	end
	mSleep(2000)
	return 超鬼王界面.Next()
	
end

function 超鬼王界面.to探索界面()
	if 参数.超鬼王结算完成后切换 then
		while true do
			if not(操作.识别2(标识.超鬼王界面_自己发现标识)) then
				break
			elseif 操作.识别2(标识.超鬼王界面_结算完成) and not(操作.识别2(标识.超鬼王界面_五六星结算未完成)) then
				break
			end
			sysLog('等待鬼王消失')
			mSleep(3000)
		end
	end
	
	if 参数.超鬼王发现五十次后切换为主任务 and 参数.任务~='超鬼王' then
		local ocr, msg = createOCR({type = "tesseract", })
		local colorTbl = binarizeImage({
			rect = {200,567,255,585},
			diff = {"0xc0ae91-0x4d4d4d"}
		})
		local code, text = ocr:getText({
			data=colorTbl,
			whitelist = "0123456789/" 
		})
		if trim(text)=='50/50' then
			ocr:release()
			for i=1,3 do
				toast('今日发现次数已满，不再执行当前主任务，仅接受邀请！')
				vibrator()
				mSleep(2000)
			end
			return 执行任务.切换超鬼王为主任务()
		end
	end
	
	操作.点击按钮(按钮.超鬼王界面_退出按钮)
	mSleep(1000)
	参数.主任务=true
	参数.超鬼王中=false
	执行任务.设置流程()
	if 参数.智能开关buff then
		参数.调整开关buff='开'
	end
	sysLog('切换主任务')
	return 执行任务.主任务()
end

function 超鬼王界面.血线识别(血量识别区域)
	--检查血线
	local ocr, msg = createOCR({type = "tesseract", })
	local colorTbl = binarizeImage({
		rect = 血量识别区域,
		diff = {参数.超鬼王血线识别色域}
	})

	local code, hp_raw = ocr:getText({
		data=colorTbl,
		whitelist = "/0123456789" 
	})
	ocr:release()

	--sysLog(hp_raw)
	hp=Split(hp_raw,'/',2)
	if hp[1]==nil or hp[2]==nil then
		hp=Split(hp_raw,' ',2)
	end
	if hp[1]==nil or hp[2]==nil then
		if 操作.或识别点击({按钮.真蛇消息关闭按钮,按钮.拒绝邀请按钮},true) then
			mSleep(666)
			return 超鬼王界面.to战斗准备界面()
		else
			当前血线=100
			for i=1,2 do
				sysLog('识别血线失败！')
				vibrator()
				mSleep(1000)
			end
		end
	else
		currenthp=tonumber(LuaRemove(hp[1],' '))
		maxhp=tonumber(LuaRemove(hp[2],' '))
		if currenthp==nil or maxhp==nil then
			if 操作.或识别点击({按钮.真蛇消息关闭按钮,按钮.拒绝邀请按钮},true) then
				mSleep(666)
				return 超鬼王界面.to战斗准备界面()
			else
				当前血线=100
				for i=1,2 do					
					sysLog('识别血线失败！')
					vibrator()
					mSleep(1000)
				end
			end
		else
			当前血线=currenthp/maxhp*100
		end
--		sysLog(string.format('%d',currenthp))
--		sysLog(string.format('%d',maxhp))
		if 参数.超鬼王显示血线 then
			--sysLog(string.format('%d',currenthp)..' / '..string.format('%d',maxhp))
			sysLog(currenthp..' / '..maxhp)
			mSleep(2000)
		end
	end
	
	
	return 当前血线
	
end
----


超鬼王邀请界面={}

function 超鬼王邀请界面.邀请(邀请方式)
	for i=1,5 do
		if 操作.识别2(标识.超鬼王邀请界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(600*参数.延时倍数)
	end

	if 邀请方式=='公开' then
		操作.点击按钮(按钮.超鬼王邀请界面_公开按钮)
		mSleep(666)
		操作.点击按钮(按钮.超鬼王邀请界面_确认按钮)
	elseif 邀请方式=='邀请5个好友' then
		操作.点击按钮(按钮.超鬼王邀请界面_好友按钮)
		mSleep(500)
		for i=1,5 do
			if 操作.识别2(标识.邀请界面_好友分类1) then
				break
			elseif i==5 then
				return 执行任务.重新识别()
			end
			mSleep(600*参数.延时倍数)
		end
		操作.点击按钮(按钮.超鬼王邀请界面_好友1)
		mSleep(300)
		操作.点击按钮(按钮.超鬼王邀请界面_好友2)
		mSleep(300)
		操作.点击按钮(按钮.超鬼王邀请界面_好友3)
		mSleep(300)
		操作.点击按钮(按钮.超鬼王邀请界面_好友4)
		mSleep(300)
		操作.点击按钮(按钮.超鬼王邀请界面_好友5)
		mSleep(500)
		操作.点击按钮(按钮.超鬼王邀请界面_邀请按钮)
	elseif 邀请方式=='邀请5个寮友' then
		操作.点击按钮(按钮.超鬼王邀请界面_寮友按钮)
		mSleep(500)
		for i=1,5 do
			if 操作.识别2(标识.邀请界面_好友分类2) then
				break
			elseif i==5 then
				return 执行任务.重新识别()
			end
			mSleep(600*参数.延时倍数)
		end
		操作.点击按钮(按钮.超鬼王邀请界面_好友1)
		mSleep(300)
		操作.点击按钮(按钮.超鬼王邀请界面_好友2)
		mSleep(300)
		操作.点击按钮(按钮.超鬼王邀请界面_好友3)
		mSleep(300)
		操作.点击按钮(按钮.超鬼王邀请界面_好友4)
		mSleep(300)
		操作.点击按钮(按钮.超鬼王邀请界面_好友5)
		mSleep(500)
		操作.点击按钮(按钮.超鬼王邀请界面_邀请按钮)
		
	elseif 邀请方式=='邀请第1个好友' then
		操作.点击按钮(按钮.超鬼王邀请界面_好友按钮)
		mSleep(500)
		for i=1,5 do
			if 操作.识别2(标识.邀请界面_好友分类1) then
				break
			elseif i==5 then
				return 执行任务.重新识别()
			end
			mSleep(600*参数.延时倍数)
		end
		操作.点击按钮(按钮.超鬼王邀请界面_好友1)
		mSleep(500)
		操作.点击按钮(按钮.超鬼王邀请界面_邀请按钮)
		
	elseif 邀请方式=='邀请第1个寮友' then
		操作.点击按钮(按钮.超鬼王邀请界面_寮友按钮)
		mSleep(500)
		for i=1,5 do
			if 操作.识别2(标识.邀请界面_好友分类2) then
				break
			elseif i==5 then
				return 执行任务.重新识别()
			end
			mSleep(600*参数.延时倍数)
		end
		操作.点击按钮(按钮.超鬼王邀请界面_好友1)
		mSleep(500)
		操作.点击按钮(按钮.超鬼王邀请界面_邀请按钮)
	
	elseif 邀请方式=='邀请固定队友' then
		teammate_is_set=getNumberConfig("超鬼王_is_set",-1)
		if 参数.超鬼王重设固定好友 or teammate_is_set==-1 then
			--记录
			local 选中目标={x=-1,y=-1}
			while true do
				toast('请选中固定队友！')
				选中目标=操作.识别(标识.邀请界面_选中好友)
				if 选中目标.x~=-1 then
					操作.点击(选中目标)
					mSleep(1000)
					if not 操作.识别2(标识.邀请界面_选中好友) then
						break
					end
				end
				mSleep(2000)
			end
			if 操作.识别2(标识.超鬼王邀请界面_寮友) then
				setStringConfig("超鬼王_队友类型","寮友")
			else 
				setStringConfig("超鬼王_队友类型","好友")
			end
			setScreenScale(参数.设备高,参数.设备宽)
			选中目标.x=math.floor(选中目标.x/640*参数.设备高)
			选中目标.y=math.floor(选中目标.y/1136*参数.设备宽)
			c1={x=math.floor(196/1136*参数.设备宽),y=math.floor(7/640*参数.设备高)}
			c2={x=math.floor(196/1136*参数.设备宽),y=math.floor(32/640*参数.设备高)}
			c3={x=math.floor(206/1136*参数.设备宽),y=math.floor(19/640*参数.设备高)}
			c4={x=math.floor(186/1136*参数.设备宽),y=math.floor(19/640*参数.设备高)}
			c5={x=math.floor(196/1136*参数.设备宽),y=math.floor(19/640*参数.设备高)}
			Color1=string.format("%#x",tostring(getColor(选中目标.x-c1.x,选中目标.y+c1.y)))
			Color2=string.format("%#x",tostring(getColor(选中目标.x-c2.x,选中目标.y+c2.y)))
			Color3=string.format("%#x",tostring(getColor(选中目标.x-c3.x,选中目标.y+c3.y)))
			Color4=string.format("%#x",tostring(getColor(选中目标.x-c4.x,选中目标.y+c4.y)))
			Color5=string.format("%#x",tostring(getColor(选中目标.x-c5.x,选中目标.y+c5.y)))
			if #Color1<8 then
				Color1='0x0'..string.format("%x",tostring(getColor(选中目标.x-c1.x,选中目标.y+c1.y)))
			end
			if #Color2<8 then
				Color2='0x0'..string.format("%x",tostring(getColor(选中目标.x-c2.x,选中目标.y+c2.y)))
			end
			if #Color3<8 then
				Color3='0x0'..string.format("%x",tostring(getColor(选中目标.x-c3.x,选中目标.y+c3.y)))
			end
			if #Color4<8 then
				Color4='0x0'..string.format("%x",tostring(getColor(选中目标.x-c4.x,选中目标.y+c4.y)))
			end
			if #Color5<8 then
				Color5='0x0'..string.format("%x",tostring(getColor(选中目标.x-c5.x,选中目标.y+c5.y)))
			end
			--para2=tostring(0)..'|'..tostring(25)..'|'..Color2..','..tostring(-10)..'|'..tostring(12)..'|'..Color3..','..tostring(10)..'|'..tostring(12)..'|'..Color4..','..tostring(0)..'|'..tostring(12)..'|'..Color5
			para2=tostring(c1.x-c2.x)..'|'..tostring(c2.y-c1.y)..'|'..Color2..','..tostring(c1.x-c3.x)..'|'..tostring(c3.y-c1.y)..'|'..Color3..','..tostring(c1.x-c4.x)..'|'..tostring(c4.y-c1.y)..'|'..Color4..','..tostring(c1.x-c5.x)..'|'..tostring(c5.y-c1.y)..'|'..Color5
			setStringConfig("超鬼王_para1",Color1)
			setStringConfig("超鬼王_para2",para2)
			
			setNumberConfig("超鬼王_is_set",1)
			参数.超鬼王重设固定好友=false
			sysLog('固定好友记录完毕')
			setScreenScale(640,1136)
		end
		
		--识别
		para1=getStringConfig("超鬼王_para1",'????')
		para2=getStringConfig("超鬼王_para2",'????')
		队友类型=getStringConfig("超鬼王_队友类型","好友")
		if 队友类型=='好友' then
			操作.点击按钮(按钮.超鬼王邀请界面_好友按钮)
		elseif 队友类型=='寮友' then
			操作.点击按钮(按钮.超鬼王邀请界面_寮友按钮)
		end
		mSleep(500)
		for i=1,5 do
			if 操作.识别2(标识.超鬼王邀请界面) then
				break
			elseif i==5 then
				return 执行任务.重新识别()
			end
			mSleep(600*参数.延时倍数)
		end
		--local 固定好友={para1,para2,90,300,150,840,482}
		local 固定好友={para1,para2,参数.超鬼王固定好友识别度,0,0,参数.设备宽-1,参数.设备高-1}
		for page=1,10 do
			setScreenScale(参数.设备高,参数.设备宽)
			if 操作.识别点击(固定好友) then 
				setScreenScale(640,1136)
				break
			elseif page==10 then
				for i=1,5 do
					toast("找不到固定好友！")
					vibrator()
					mSleep(1500)
				end
				setScreenScale(640,1136)
				操作.点击按钮(按钮.超鬼王邀请界面_邀请按钮)
				return 执行任务.重新识别()
			else
				setScreenScale(640,1136)
				if page<=5 then
					操作.滑动(776,383,743,212,300)
				else
					操作.滑动(743,212,776,383,300)
				end
				mSleep(888)
			end
		end
		sysLog('选中固定好友')
		mSleep(500)
		操作.点击按钮(按钮.超鬼王邀请界面_邀请按钮)
	end
	mSleep(1500)
end

