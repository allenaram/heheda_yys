require 'REQUIRE'


--获取设备/应用信息--
if true then
	参数.appid = frontAppName()
	init(参数.appid,1)
	参数.设备高,参数.设备宽 = getScreenSize()
end
--------------------


-------显示UI-------
if true then
--	启动动画=createHUD()
--	launchLua()
--	hideHUD(启动动画)
	sfsm = 收费说明()
	ret,_ = sfsm:show()
	if ret == 0 then lua_exit() end
	log_ui = 更新日志()
	ret,results = log_ui:show()
	if ret == 0 then lua_exit() end
--	server = 选择服务器()
--	ret,results = server:show()
--	if ret == 0 then lua_exit() else 参数.服务器=results.服务器 end
	ui = 生成界面()
	ret,results = ui:show()
	if ret == 0 then lua_exit() end
end
--------------------

function 初始化并启动()

------选择任务------
if true then
	curVersion = 229
	------选择任务
	--服务器
	if results.服务器=='体验服' then
		参数.体服=true
	else
		参数.体服=false
	end
	if 参数.体服 then
		标识.御魂界面 = {0x5e546c,"-5|-317|0x363347,234|-325|0x6d4040,359|5|0x7d5655,693|9|0x757153,675|70|0x7f795a,48|-72|0x321f1e,401|-200|0x332120", 95, 331, 463, 368, 494}
		按钮.御魂界面_大蛇按钮={x1=153,y1=220,x2=325,y2=423}
		按钮.御魂界面_业原火按钮={x1=493,y1=185,x2=680,y2=429}
		按钮.御魂界面_卑弥呼按钮 = {x1=830,y1=174,x2=1045,y2=431}
		
		标识.大蛇界面 = {0x5e5278,"19|0|0x584d71,20|22|0x695d80,22|47|0x685c7e,84|-41|0xa4967e,79|-23|0xc5c0b5,815|392|0xe5dcc4,1000|461|0x371f16", 95, 45, 136, 94, 188}
		按钮.大蛇界面_组队按钮 = {x1=855,y1=554,x2=896,y2=579}
		按钮.大蛇界面_挑战按钮 = {x1=1010,y1=549,x2=1043,y2=586}
		按钮.大蛇界面_关闭按钮 = {x1=31,y1=28,x2=53,y2=51}
		按钮.大蛇界面_悲鸣按钮 = {}
		
		标识.觉醒界面 = {0x856c95,"2|-374|0x302d43,-255|-9|0x71819a,-263|-379|0x212c3a,-484|5|0x77775e,-523|-378|0x353426,-774|-3|0x7d545c,-799|-366|0x4e2d31", 95, 986, 481, 1046, 521}
		按钮.觉醒界面_火麒麟按钮={85,168,258,449}
		按钮.觉醒界面_风麒麟按钮={353,141,510,449}
		按钮.觉醒界面_水麒麟按钮={616,131,785,461}
		按钮.觉醒界面_雷麒麟按钮={886,151,1050,459}
		按钮.觉醒界面_退出按钮={33,30,53,50}
		
		标识.麒麟界面1={0x1b4667,"-5|20|0x1d415b,8|26|0xc8c1b3,-160|93|0xe1d9c0,-159|153|0xdcd4bb,-122|162|0x3a2110,-13|91|0xe3dac2,29|161|0x382014", 95, 1011, 435, 1045, 476}
		标识.麒麟界面2={0x1e4762,"1|21|0x1d415b,13|3|0x15344a,-154|163|0xe5dcc4,-4|162|0xe8dfc7,35|229|0x371f16", 95, 1023, 371, 1040, 396}
		按钮.麒麟界面_组队按钮={856,548,898,581}
		按钮.麒麟界面_挑战按钮={1005,543,1047,584}
		按钮.麒麟界面_关闭按钮={36,33,53,53}
		
		标识.业原火界面={0x321a1a,"7|34|0x402727,18|-3|0x351d1d,4|-9|0xd7d3cb,261|33|0xcd76a8,332|76|0xdd7fb3,248|148|0xfbf5fe,257|180|0x1f8e76", 95, 501, 154, 526, 183}
		按钮.业原火界面_贪按钮={220,151,}
		按钮.业原火界面_嗔按钮={199,286,395,334}
		按钮.业原火界面_痴按钮={188,414,391,465}
		按钮.业原火界面_挑战按钮={1009,549,1048,584}
		按钮.业原火界面_关闭按钮={31,28,48,50}
		
		标识.御灵界面1={0xd1596b,"55|54|0x67629f,34|69|0xd9687d,29|144|0xfafaf9,2|143|0xd06c7c,66|345|0xe3d9cc,13|354|0xbfb19f,-29|268|0x312627", 95, 435, 182, 449, 202}
		标识.御灵界面2={0x3d3434,"16|11|0x261f1f,52|37|0x2a2323,64|343|0xdadada,11|346|0xb2b2b2,-60|382|0xdbdbdb,-42|255|0x281f20", 95, 436, 181, 446, 195}
		按钮.御灵界面_神龙按钮={131,199,240,448}
		按钮.御灵界面_白藏主按钮={366,138,515,510}
		按钮.御灵界面_黑豹按钮={631,168,775,501}
		按钮.御灵界面_孔雀按钮={888,173,1033,488}
		
		标识.神兽界面={0x3d3d3d,"-5|8|0x383536,-19|-6|0x301f21,226|190|0x9c2b14,243|206|0x473a39,218|511|0xe2d9c1,256|586|0x371f16", 95, 788, 10, 802, 30}
		按钮.神兽界面_挑战按钮={999,546,1039,584}
		按钮.神兽界面_关闭按钮={24,23,41,44}
		
		function 大蛇界面.层数识别预处理(X, Y)
			-- 图像二值化 --
			local colorTbl = binarizeImage({
				rect = {X,Y,X+32,Y+32},
				diff = {"0x34312e-0x4f4f4f"}
			})
			-- 把无效行（全1行）重置成全0行 --
			for _, row in pairs(colorTbl) do
				local 无效行 = true
				for n = 1, #row do
					if row[n] == 0 then
						无效行 = false
						break
					end
				end
				if 无效行 then
					for n = 1, #row do
						row[n] = 0
					end
				end
			end
			
			local 全零行数=0
			for _, row in pairs(colorTbl) do
				local 全零行 = true
				for n = 1, #row do
					if row[n] == 1 then
						全零行 = false
						break
					end
				end
				if 全零行 then
					全零行数 = 全零行数 + 1
				end
			end
			--  sysLog(string.format('全零行数：%d，总行数：%d',全零行数,#colorTbl))
			--	for _, row in pairs(colorTbl) do
			--		sysLog(table.concat(row, ','))
			--	end
			local 字符有效 = 全零行数 > (#colorTbl*3/4) and false or true
			return 字符有效, colorTbl
		end

		function 选层.选择层数(目标层数, 寻找方向, ocr)
			local x1,y1,x2,y2
			if 寻找方向=='从上到下' then	
				x1,y1,x2,y2 = 330, 200, 330, 350
			elseif 寻找方向=='从下到上' then
				x1,y1,x2,y2 = 330, 350, 330, 200
			end	
			
			local found = false
			local 层数按钮 = {x=-1, y=-1}
			for i = 1, 3 do
				local X = 250
				keepScreen(true)
				if 目标层数=='悲鸣' then
					if 操作.识别点击(按钮.大蛇界面_悲鸣) then
						mSleep(500)
						return true
					end
				else
					for Y = 528, 132, -5 do
						local 字符有效, colorTbl = 选层.层数识别预处理(X, Y)
						local code, text
						if 字符有效 then
							code, text = ocr:getText({
								data = colorTbl,
								whitelist = "壹贰叁肆伍陆柒捌玖拾" 
							})
						end
						if trim(text) == 目标层数 then 
							层数按钮 = {x=X, y=Y+15}
							操作.点击(层数按钮)
							found = true
							mSleep(500)
							break
						end
					end
				end
				keepScreen(false)
				if found then
					break
				end
				
				操作.滑动(x1,y1,x2,y2,200)
				mSleep(600)
			end
			return found
		end
		
	end
	
	式神录界面.Next = 育成界面.to式神录界面
	育成界面.Next = 式神录界面.to育成界面
	
	--主副任务
	参数.任务=results.选择任务
	参数.交叉个人突破=results.穿插任务.穿插个人突破
	参数.交叉寮突破=results.穿插任务.穿插寮突破
	参数.交叉年兽=results.穿插任务.穿插年兽
	参数.交叉犬夜叉=results.穿插任务.穿插犬夜叉
	参数.交叉超鬼王=results.穿插任务.超鬼王
	参数.交叉离岛= results.穿插任务.离岛之歌
	--智能开关
	参数.开关buff表.觉醒=results.开关buff表.觉醒buff
	参数.开关buff表.御魂=results.开关buff表.御魂buff
	参数.开关buff表.金币=results.开关buff表.金币buff
	参数.开关buff表.经验=results.开关buff表.经验buff
	参数.开关buff表_temp.觉醒=参数.开关buff表.觉醒
	参数.开关buff表_temp.御魂=参数.开关buff表.御魂
	参数.开关buff表_temp.金币=参数.开关buff表.金币
	参数.开关buff表_temp.经验=参数.开关buff表.经验
	if 参数.开关buff表.觉醒 or 参数.开关buff表.御魂 or 参数.开关buff表.金币 or 参数.开关buff表.经验 then
		参数.智能开关buff=true
		参数.调整开关buff='开'
	end
	--接受协作
	参数.协作表.排骨=results.接受协作.排骨
	参数.协作表.鲜鱼=results.接受协作.鲜鱼
	参数.协作表.勾协=results.接受协作.勾协
	参数.协作表.体协=results.接受协作.体协
	参数.协作表.三万=results.接受协作.三万
	参数.协作表.两万=results.接受协作.两万
	参数.协作表.一万=results.接受协作.一万
	if 参数.协作表.排骨 or 参数.协作表.鲜鱼 or 参数.协作表.勾协 or 参数.协作表.体协 or 参数.协作表.三万 or 参数.协作表.两万 or 参数.协作表.一万 then
		参数.接受协作=true
	end
	----其他设置
	--可视化
	参数.可视点击=results.可视化.可视点击
	参数.提示信息=results.可视化.提示信息
	--重连设置
	参数.闪退重连=results.重连.闪退重连
	参数.检查后台=results.重连.禁止切出游戏
	if 参数.提示信息 then
		myhud=createHUD()
	end
	--自动战斗设置
	参数.技能可选 = results.技能可选.自动战斗技能可选
	--体力用完
	if results.体力用完=='关闭Buff并结束主任务' then
		参数.自动购买体力=false
	elseif results.体力用完=='自动购买体力' then
		参数.自动购买体力=true
	end
	--队友未响应
	if results.队友未响应=='关闭Buff并结束主任务' then
		参数.队友未响应结束主任务=true
	elseif results.体力用完=='继续等待' then
		参数.队友未响应结束主任务=false
	end
	--禁止聊天
	if results.禁止聊天.强制关闭频道和私信 then
		参数.禁止聊天=true
	else
		参数.禁止聊天=false
	end
	--延时倍数
	if results.延时倍数=='1倍' then
		参数.延时倍数=1
	elseif results.延时倍数=='1.5倍' then
		参数.延时倍数=1.5	
	elseif results.延时倍数=='2倍' then
		参数.延时倍数=2
	elseif results.延时倍数=='2.5倍' then
		参数.延时倍数=2.5
	end
	--满级识别度
	参数.满级识别度=tostring(results.满级识别度)
end
--------------------


------御魂设置------
if 参数.任务=='御魂' then
	------选择副本
	if results.御魂选择BOSS=='八歧大蛇' then 
		参数.任务='大蛇'
	elseif results.御魂选择BOSS=='业原火' then
		参数.任务='业原火'
		--选择层数
		参数.业原火层数=results.业原火层数 
		--标记
		参数.业原火_点怪 = results.业原火是否点怪.点怪
		if 参数.业原火_点怪 then
			参数.业原火_点怪一回目 = results.业原火点怪一回目
			参数.业原火_点怪二回目 = results.业原火点怪二回目
			参数.业原火_点怪三回目 = results.业原火点怪三回目
		end
		if results.业原火是否标记己方.标记己方 then
			参数.业原火标记己方 = results.业原火标记己方
		else
			参数.业原火标记己方 = 0
		end
	end
	------换狗粮
	参数.御魂换狗粮=results.御魂换狗粮.换狗粮
	if 参数.御魂换狗粮 then
		--狗粮位置
		参数.狗粮表.左一=results.御魂狗粮位.左一
		参数.狗粮表.左二=results.御魂狗粮位.左二
		参数.狗粮表.中间=results.御魂狗粮位.中间
		参数.狗粮表.右二=results.御魂狗粮位.右二
		参数.狗粮表.右一=results.御魂狗粮位.右一
		--狗粮预翻页
		参数.狗粮预翻页=results.御魂狗粮预翻页+0
		--狗粮筛选
		参数.狗粮稀有度=results.御魂狗粮稀有度
		参数.不上白蛋=results.御魂狗粮类型.不上白蛋
		参数.不上红蛋=results.御魂狗粮类型.不上红蛋
		参数.不上蓝蛋=results.御魂狗粮类型.不上蓝蛋
		参数.不上改名式神=results.御魂狗粮类型.不上改名式神
		参数.只上白蛋=results.御魂狗粮类型.只上白蛋
		参数.只上改名式神=results.御魂狗粮类型.只上改名式神
	end
	参数.御魂超出上限=false
end
if 参数.任务=='大蛇' then 
	------大蛇设置
	--选择层数
	参数.使用默认层数=results.御魂使用默认层数.默认当前层数
	if results.御魂层数=='一层' then 
		参数.御魂层数='壹'
	elseif results.御魂层数=='二层' then
		参数.御魂层数='贰'
	elseif results.御魂层数=='三层' then
		参数.御魂层数='叁'
	elseif results.御魂层数=='四层' then
		参数.御魂层数='肆'
	elseif results.御魂层数=='五层' then
		参数.御魂层数='伍'
	elseif results.御魂层数=='六层' then
		参数.御魂层数='陆'
	elseif results.御魂层数=='七层' then
		参数.御魂层数='柒'
	elseif results.御魂层数=='八层' then
		参数.御魂层数='捌'
	elseif results.御魂层数=='九层' then
		参数.御魂层数='玖'
	elseif results.御魂层数=='十层' then
		参数.御魂层数='拾'
	elseif results.御魂层数=='悲鸣' then
		参数.御魂层数='悲鸣'
	end
	--组队方式
	参数.组队方式=results.御魂组队方式
	参数.重设固定好友=results.御魂重设固定队友.重设固定队友
	if 参数.组队方式=='3人队长' then 
		参数.队伍人数=3 
	elseif 参数.组队方式=='2人队长' then 
		参数.队伍人数=2 
	end
	--集火设置
	参数.御魂点怪=results.御魂是否点怪.点怪
	if 参数.御魂点怪 then
		参数.回目数=0
		参数.御魂点怪一回目=results.御魂点怪一回目
		参数.御魂点怪二回目=results.御魂点怪二回目
		参数.御魂点怪三回目=results.御魂点怪三回目
	end
	--标记己方
	if results.大蛇是否标记己方.标记己方 then
		参数.大蛇标记己方 = results.大蛇标记己方
	else
		参数.大蛇标记己方 = 0
	end
	----组队设置
	--队长设置
	if 参数.组队方式=='3人队长' or 参数.组队方式=='2人队长' then
		参数.队伍类型=results.御魂队伍类型
		参数.房间邀请=results.御魂是否邀请.邀请
		if 参数.房间邀请 then
			参数.房间邀请人数=results.御魂邀请人数
			参数.房间邀请目标=results.御魂邀请目标
		end
		参数.失败重邀=results.御魂重邀.失败重邀
		参数.默认邀请队友=results.御魂重邀.默认邀请队友
	end
	--队员设置
	if 参数.组队方式=='队员' then
		参数.默认接受邀请=results.御魂自动接受.自动接受邀请
	end
end
--------------------


------觉醒设置------
if 参数.任务=='觉醒' then
	--选择目标
	参数.麒麟属性=results.麒麟属性
	--选择层数
	参数.使用默认层数=results.觉醒使用默认层数.默认当前层数
	if results.觉醒层数=='一层' then 
		参数.觉醒层数='壹'
	elseif results.觉醒层数=='二层' then
		参数.觉醒层数='贰'
	elseif results.觉醒层数=='三层' then
		参数.觉醒层数='叁'
	elseif results.觉醒层数=='四层' then
		参数.觉醒层数='肆'
	elseif results.觉醒层数=='五层' then
		参数.觉醒层数='伍'
	elseif results.觉醒层数=='六层' then
		参数.觉醒层数='陆'
	elseif results.觉醒层数=='七层' then
		参数.觉醒层数='柒'
	elseif results.觉醒层数=='八层' then
		参数.觉醒层数='捌'
	elseif results.觉醒层数=='九层' then
		参数.觉醒层数='玖'
	elseif results.觉醒层数=='十层' then
		参数.觉醒层数='拾'
	end
	--组队方式
	参数.组队方式=results.觉醒组队方式
	参数.重设固定好友=results.觉醒重设固定队友.重设固定队友
	if 参数.组队方式=='3人队长' then 
		参数.队伍人数=3 
	elseif 参数.组队方式=='2人队长' then 
		参数.队伍人数=2 
	end
	--集火设置
	参数.觉醒点怪=results.觉醒点怪.点怪
	参数.觉醒点怪目标=results.觉醒集火目标
	--标记己方
	if results.觉醒是否标记己方.标记己方 then
		参数.觉醒标记己方 = results.觉醒标记己方
	else
		参数.觉醒标记己方 = 0
	end
	----组队设置
	--队长设置
	if 参数.组队方式=='3人队长' or 参数.组队方式=='2人队长' then
		参数.队伍类型=results.觉醒队伍类型
		参数.房间邀请=results.觉醒是否邀请.邀请
		if 参数.房间邀请 then
			参数.房间邀请人数=results.觉醒邀请人数
			参数.房间邀请目标=results.觉醒邀请目标
		end
		参数.失败重邀=results.觉醒重邀.失败重邀
		参数.默认邀请队友=results.觉醒重邀.默认邀请队友
	end
	--队员设置
	if 参数.组队方式=='队员' then
		参数.默认接受邀请=results.觉醒自动接受.自动接受邀请
	end
end
--------------------


------探索设置------
if 参数.任务=='探索' then
	--探索方式
	参数.探索组队类型=results.探索组队类型
	参数.重设固定好友=results.探索重设固定队友.重设固定队友
	----队长设置
	if 参数.探索组队类型~='队员' then
		--选择章节
		参数.探索章节=results.探索章节
		if results.探索章节=='第一章' then
			参数.探索滑屏总次数=6
		elseif results.探索章节=='第二章' then
			参数.探索滑屏总次数=6
		elseif results.探索章节=='第三章' then
			参数.探索滑屏总次数=6
		elseif results.探索章节=='第四章' then
			参数.探索滑屏总次数=6
		elseif results.探索章节=='第五章' then
			参数.探索滑屏总次数=8
		elseif results.探索章节=='第六章' then
			参数.探索滑屏总次数=6
		elseif results.探索章节=='第七章' then
			参数.探索滑屏总次数=8
		elseif results.探索章节=='第八章' then
			参数.探索滑屏总次数=10
		elseif results.探索章节=='第九章' then
			参数.探索滑屏总次数=6
		elseif results.探索章节=='第十章' then
			参数.探索滑屏总次数=6
		elseif results.探索章节=='第十一章' then
			参数.探索滑屏总次数=6
		elseif results.探索章节=='第十二章' then
			参数.探索滑屏总次数=4
		elseif results.探索章节=='第十三章' then
			参数.探索滑屏总次数=4
		elseif results.探索章节=='第十四章' then
			参数.探索滑屏总次数=6
		elseif results.探索章节=='第十五章' then
			参数.探索滑屏总次数=6
		elseif results.探索章节=='第十六章' then
			参数.探索滑屏总次数=4
		elseif results.探索章节=='第十七章' then
			参数.探索滑屏总次数=6
		elseif results.探索章节=='第十八章' then
			参数.探索滑屏总次数=6
		elseif results.探索章节=='第十九章' then
			参数.探索滑屏总次数=6
		elseif results.探索章节=='第二十章' then
			参数.探索滑屏总次数=6
		elseif results.探索章节=='第二十一章' then
			参数.探索滑屏总次数=4
		elseif results.探索章节=='第二十二章' then
			参数.探索滑屏总次数=6
		elseif results.探索章节=='第二十三章' then
			参数.探索滑屏总次数=4
		elseif results.探索章节=='第二十四章' then
			参数.探索滑屏总次数=10
		elseif results.探索章节=='第二十五章' then
			参数.探索滑屏总次数=8
		elseif results.探索章节=='第二十六章' then
			参数.探索滑屏总次数=8
		elseif results.探索章节=='第二十七章' then
			参数.探索滑屏总次数=8
		elseif results.探索章节=='第二十八章' then
			参数.探索滑屏总次数=8
		end
		
		if results.探索难度=='普通' and results.探索组队类型=='单人' then
			参数.探索困难=false
		else
			参数.探索困难=true
		end
		--章节识别
		if results.探索选关模式=='快速识别' then
			参数.探索选关步长=10
		else
			参数.探索选关步长=1
		end
		--选择目标
		参数.探索选怪.经验怪=results.选择怪物.经验怪
		参数.探索选怪.金币怪=results.选择怪物.金币怪
		参数.探索选怪.御魂怪=results.选择怪物.御魂怪
		参数.探索选怪.打BOSS=results.选择怪物.打BOSS
		参数.BOSS已挑战=0
		--邀请目标
		参数.探索邀请目标=results.探索邀请目标
	end
	----队员设置
	if 参数.探索组队类型=='队员' then
		--发现宝物
		if results.探索发现=='优先接受邀请' then
			参数.探索优先接受邀请=true
		elseif results.探索发现=='优先处理探索发现' then
			参数.探索优先接受邀请=false
		end
	end
	--点怪设置
	参数.探索点怪=results.探索点怪.点怪
	参数.探索点怪目标=results.探索集火目标
	--标记己方
	if results.探索是否标记己方.标记己方 then
		参数.探索标记己方 = results.探索标记己方
	else
		参数.探索标记己方 = 0
	end
	--狗粮设置
	参数.换狗粮=results.狗粮设置.换狗粮
	参数.狗粮普攻=results.狗粮设置.狗粮普攻
	--狗粮预翻页
	参数.狗粮预翻页=results.狗粮预翻页+0
	--狗粮位置
	参数.狗粮表.左前=results.前排式神.左前
	参数.狗粮表.中前=results.前排式神.中前
	参数.狗粮表.右前=results.前排式神.右前
	参数.狗粮表.左后=results.左后式神.左后
	参数.狗粮表.右后=results.右后式神.右后
	if 参数.探索组队类型=='单人' or 参数.探索组队类型=='队员' then
		参数.狗粮表.左后=false
		参数.狗粮表.右后=false
	elseif 参数.探索组队类型=='队长' then
		参数.狗粮表.左前=false
		参数.狗粮表.中前=false
		参数.狗粮表.右前=false
	end
	--狗粮筛选
	参数.狗粮稀有度=results.狗粮稀有度
	参数.不上白蛋=results.狗粮类型.不上白蛋
	参数.不上红蛋=results.狗粮类型.不上红蛋
	参数.不上蓝蛋=results.狗粮类型.不上蓝蛋
	参数.不上改名式神=results.狗粮类型.不上改名式神
	参数.只上白蛋=results.狗粮类型.只上白蛋
	参数.只上改名式神=results.狗粮类型.只上改名式神
	
end
--------------------


---超鬼王（主）设置---
if 参数.任务=='超鬼王' then
	参数.交叉超鬼王=true
end
--------------------


------突破设置------
if 参数.任务=='突破' then
	------突破任务
	--选择任务
	参数.突破方式=results.突破方式
	------个人突破设置
	if 参数.突破方式=='个人突破' then
		参数.交叉个人突破=false
		--刷新方式
		参数.个人突破刷新方式=results.个人突破刷新方式
		--突破目标
		参数.个人突破最高勋章=results.个人突破最高勋章+0
		参数.个人突破最低勋章=results.个人突破最低勋章+0
		参数.个人突破方向=results.个人突破方向
		--标记己方
		if results.个人突破是否标记己方.标记己方 then
			参数.个人突破标记己方 = results.个人突破标记己方
		else
			参数.个人突破标记己方 = 0
		end
	------寮突破设置
	elseif 参数.突破方式=='寮突破' then
		参数.交叉寮突破=false
		--突破目标
		参数.寮突破最高勋章=results.寮突破最高勋章+0
		参数.寮突破最低勋章=results.寮突破最低勋章+0
		参数.寮突破方向=results.寮突破方向
		--标记己方
		if results.寮突破是否标记己方.标记己方 then
			参数.寮突破标记己方 = results.寮突破标记己方
		else
			参数.寮突破标记己方 = 0
		end
		--设置CD
		参数.寮突破间隔=results.寮突破间隔*60000
	end
	
end
--------------------


------御灵设置------
if 参数.任务=='御灵' then
	------御灵之境
	--御灵目标
	参数.御灵目标=results.御灵目标
	--选择层数
	if results.御灵层数=='一层' then 
		参数.御灵层数='壹'
	elseif results.御灵层数=='二层' then
		参数.御灵层数='贰'
	elseif results.御灵层数=='三层' then
		参数.御灵层数='叁'
	end
	--点怪
	参数.御灵点草人=results.御灵点草人.标记草人
end
--------------------


-----修罗战场设置-----
if 参数.任务 == '修罗战场' then
	参数.修罗战场_副本=results.修罗战场_副本
	参数.修罗战场_难度 = results.修罗战场_难度
	参数.修罗战场_士气下限 = tonumber(results.修罗战场_士气下限)
	参数.修罗战场_点怪=results.修罗战场_是否点怪.点怪
	if 参数.修罗战场_点怪 then
		参数.回目数=0
		参数.修罗战场_点怪一回目=results.修罗战场_点怪一回目
		参数.修罗战场_点怪二回目=results.修罗战场_点怪二回目
		参数.修罗战场_点怪三回目=results.修罗战场_点怪三回目
	end
	参数.修罗战场标记己方 = results.修罗战场是否标记己方.标记己方 and results.修罗战场标记己方 or 0
	按钮.战斗结算界面2_结算区域 = 按钮.战斗结束界面_结算区域
	
end
--------------------


-----海国退治设置-----
if 参数.任务=='决战鬼王座' then
	参数.任务 = '海国退治'
	local tScore =
	{
		["不退"] = 100000000,
		["伤害满五百万"] = 5000000,
		["伤害满一千万"] = 10000000,
	}
	参数.海国退治_退出分数 = tScore[results.海国退治_退出条件]
	参数.海国退治_标记 = results.海国退治_点怪.点怪 and results.海国退治_标记 or 0	
	if results.海国退治是否标记己方.标记己方 then
		参数.海国退治标记己方 = results.海国退治标记己方
	else
		参数.海国退治标记己方 = 0
	end
	按钮.战斗结算界面2_结算区域 = 按钮.战斗结束界面_结算区域
end
---------------------


-----离岛之歌设置-----
if 参数.任务 == '离岛之歌' then
	参数.离岛CD冷却时刻 = -1
	参数.离岛副本 = results.离岛副本
	参数.离岛难度 = results.离岛难度
	参数.离岛点怪 = results.离岛点怪.点怪
	if 参数.离岛点怪 then
		参数.离岛点怪目标 = results.离岛集火目标
	end
	参数.离岛免费泡澡 = results.离岛活力耗尽.泡澡
	参数.离岛消耗勾玉 = results.离岛活力耗尽.消耗勾玉
	参数.离岛汤浴 = results.离岛汤浴
	参数.离岛CD时消耗勾玉 = true
end
--------------------


------妖气设置------
if 参数.任务=='妖气' then
	------妖气封印
	--选择目标
	参数.妖气目标={}
	local tDungeon = 
	{
		["日和坊"] = "日",
		["小松丸"] = "小",
		["鬼使黑"] = "鬼",
		["海坊主"] = "海",
		["跳跳哥哥"] = "跳",
		["二口女"] = "二",
		["骨女"] = "骨",
		["椒图"] = "椒",
		["饿鬼"] = "饿",
	}
	local tBtn = 
	{
		["日"] = 按钮.组队界面_日和坊,
		["小"] = 按钮.组队界面_小松丸,
		["鬼"] = 按钮.组队界面_鬼使黑,
		["海"] = 按钮.组队界面_海坊主,
		["跳"] = 按钮.组队界面_跳跳妹妹,
		["二"] = 按钮.组队界面_二口女,
		["骨"] = 按钮.组队界面_骨女,
		["椒"] = 按钮.组队界面_椒图,
		["饿"] = 按钮.组队界面_饿鬼,
	}
	参数.妖气目标.size = 0
	for dungeon, abbr in pairs(tDungeon) do
		参数.妖气目标[abbr] = results.妖气目标[dungeon]
		if 参数.妖气目标[abbr] then
			参数.妖气目标.size = 参数.妖气目标.size + 1
			参数.妖气目标按钮 = tBtn[abbr]
		end
	end
	if results.妖气挤房模式 == '排队' then
		参数.妖气挤房模式 = '排队'
	elseif 参数.妖气目标.size == 1 then
		参数.妖气挤房模式 = '新版挤房'
	else
		参数.妖气挤房模式 = '旧版挤房'
		参数.妖气目标按钮 = 按钮.组队界面_全部
	end
end
--------------------


------轮回秘境设置------
if 参数.任务=='轮回秘境' then
	参数.轮回秘境_推图策略 = results.轮回秘境_推图策略
	参数.轮回秘境_使用眼 = results.轮回秘境_使用眼.使用轮回之眼
	参数.轮回秘境_掉落选择 = results.轮回秘境_掉落选择
	local tPattern = 
	{
		["轮回之眼"] = {按钮.轮回秘境界面_眼, 按钮.轮回秘境界面_可打眼},
		["宝箱"] = {按钮.轮回秘境界面_箱子, 按钮.轮回秘境界面_可打箱子},
		["时曲碎片"] = {按钮.轮回秘境界面_碎片, 按钮.轮回秘境界面_可打碎片},
		["未翻格子"] = {按钮.轮回秘境界面_牌背, 按钮.轮回秘境界面_可打牌背},
		["普通格子"] = {按钮.轮回秘境界面_普通, 按钮.轮回秘境界面_可打普通},
	}
	参数.轮回秘境_优先级 = 
	{
		[1] = tPattern[results.轮回秘境_第一优先],
		[2] = tPattern[results.轮回秘境_第二优先],
		[3] = tPattern[results.轮回秘境_第三优先],
		[4] = tPattern[results.轮回秘境_第四优先],
		[5] = tPattern[results.轮回秘境_第五优先]
	}
	参数.轮回秘境_标记 = nil
	if results.轮回秘境_标记.点怪 then
		参数.轮回秘境_标记 = results.轮回秘境_标记目标
	end
	参数.轮回秘境_标记己方 = 0
	if results.轮回秘境_是否标记己方.标记己方 then
		参数.轮回秘境_标记己方 = results.轮回秘境_标记己方
	end
end
-----------------------

------狗粮升星设置------
if 参数.任务=='狗粮升星' then
	参数.式神录界面_界面已设置 = false
	参数.育成界面_界面已设置 = false
	local tStar = 
	{
		['2星升3星'] = 2,
		['3星升4星'] = 3,
		['4星升5星'] = 4,
	}
	参数.狗粮升星_星级 = tStar[results.狗粮升星_星级]
	参数.狗粮升星_目标 = results.狗粮升星_目标
	参数.狗粮升星_次数 = tonumber(results.狗粮升星_次数)
	参数.狗粮升星_剩余次数 = 参数.狗粮升星_次数
	参数.狗粮升星_材料 = 
	{
		['N卡'] = results.狗粮升星_材料.N卡, 
		['白蛋'] = results.狗粮升星_材料.白蛋,
		['红蛋'] = results.狗粮升星_材料.红蛋,
		['蓝蛋'] = results.狗粮升星_材料.蓝蛋,
		['黑蛋'] = false,
	}
	参数.狗粮升星_材料分类方式 = results.狗粮升星_材料分类方式
	参数.狗粮升星_继续升星 = results.狗粮升星_选择下一个升星目标=='点击“继续升星”自动选择下一个'
end
------------------------

--------抽厕纸设置-------
if 参数.任务 == '抽厕纸' then
	参数.抽厕纸_数量 = tonumber(results.抽厕纸_数量)
	参数.抽厕纸_当前数量 = 0
end
------------------------


-----副任务设置-----
if 参数.交叉个人突破 then
	参数.主任务=false
	参数.个人突破开始计时时刻=-1
	------个人突破设置
	--刷新方式
	参数.个人突破刷新方式=results.个人突破刷新方式
	--突破目标
	参数.个人突破最高勋章=results.个人突破最高勋章+0
	参数.个人突破最低勋章=results.个人突破最低勋章+0
	参数.个人突破方向=results.个人突破方向
	--标记己方
	if results.个人突破是否标记己方.标记己方 then
		参数.个人突破标记己方 = results.个人突破标记己方
	else
		参数.个人突破标记己方 = 0
	end
	----穿插个人突破设置
	--穿插设置
	参数.个人突破穿插依据=results.个人突破穿插依据
	--设置CD
	参数.个人突破间隔=results.个人突破间隔*60000
end
if 参数.交叉寮突破 then
	参数.主任务=false
	参数.寮突破开始计时时刻=-1
	------寮突破设置
	--突破目标
	参数.寮突破最高勋章=results.寮突破最高勋章+0
	参数.寮突破最低勋章=results.寮突破最低勋章+0
	参数.寮突破方向=results.寮突破方向
	--标记己方
	if results.寮突破是否标记己方.标记己方 then
			参数.寮突破标记己方 = results.寮突破标记己方
		else
			参数.寮突破标记己方 = 0
		end
	--设置CD
	参数.寮突破间隔=results.寮突破间隔*60000
end
if 参数.交叉年兽 then
	------年兽
	--穿插设置
	参数.年兽挤车=results.年兽挤车.挤车
	参数.年兽挤车开金币buff=results.交叉年兽开金币buff.挤车时开启
	参数.年兽自己发现开金币buff=results.交叉年兽开金币buff.自己发现时开启
	if 参数.年兽挤车 then
		参数.主任务=false
		参数.年兽开始计时时刻=-1
	else
		参数.年兽开始计时时刻=2*mTime()
	end
end
if 参数.交叉超鬼王 then
	参数.超鬼王开始计时时刻=-1
	参数.默认接受邀请=false
	------超鬼王
	--攻打目标
	if results.攻打好友邀请的超鬼王.好友邀请 then
		参数.超鬼王只打自己发现的=false
	else
		参数.超鬼王只打自己发现的=true
	end
	参数.自己发现的超鬼王最低打几星=tonumber(results.自己发现的超鬼王最低打几星)
	参数.自己发现的超鬼王最高打几星=tonumber(results.自己发现的超鬼王最高打几星)
	参数.自己发现的超鬼王攻打血线=tonumber(results.自己发现的超鬼王攻打血线)
	参数.超鬼王结算完成后切换=results.超鬼王结算完成后切换.结算完成后切换主任务
	参数.好友邀请的超鬼王最低打几星=tonumber(results.好友邀请的超鬼王最低打几星)
	参数.好友邀请的超鬼王最高打几星=tonumber(results.好友邀请的超鬼王最高打几星)
	参数.好友邀请的超鬼王攻打血线=tonumber(results.好友邀请的超鬼王攻打血线)
	if not(results.攻打自己发现的超鬼王.自己发现) then
		参数.自己发现的超鬼王最低打几星=0
		参数.自己发现的超鬼王最高打几星=0
	end
	--点怪
	if results.标记超鬼王.标记BOSS or results.标记超鬼王.标记草人 then
		参数.标记超鬼王=true
	else
		参数.标记超鬼王=false
	end
	if 参数.标记超鬼王 then
		if results.标记超鬼王.标记BOSS and not(results.标记超鬼王.标记草人) then
			参数.超鬼王点怪方式='标记BOSS'
		elseif results.标记超鬼王.标记BOSS and results.标记超鬼王.标记草人 then
			参数.超鬼王点怪方式='标记BOSS和草人'
		elseif not(results.标记超鬼王.标记BOSS) and results.标记超鬼王.标记草人 then
			参数.超鬼王点怪方式='标记草人'
		end
	end
--	参数.标记超鬼王=results.超鬼王点怪.启用点怪
--	if 参数.标记超鬼王 then
--		参数.超鬼王点怪方式=results.超鬼王点怪方式
--	end
	--切换阵容
	参数.超鬼王切换阵容血线.六星=tonumber(results.六星切换阵容血线)
	参数.超鬼王切换阵容血线.五星=tonumber(results.五星切换阵容血线)
	参数.超鬼王切换阵容血线.四星=tonumber(results.四星切换阵容血线)
	参数.超鬼王切换阵容血线.三星=tonumber(results.三星切换阵容血线)
	参数.超鬼王切换阵容血线.二星=tonumber(results.二星切换阵容血线)
	参数.超鬼王切换阵容血线.一星=tonumber(results.一星切换阵容血线)
	参数.超鬼王阵容.六星一队=results.六星一队
	参数.超鬼王阵容.六星二队=results.六星二队
	参数.超鬼王阵容.五星一队=results.五星一队
	参数.超鬼王阵容.五星二队=results.五星二队
	参数.超鬼王阵容.四星一队=results.四星一队
	参数.超鬼王阵容.四星二队=results.四星二队
	参数.超鬼王阵容.三星一队=results.三星一队
	参数.超鬼王阵容.三星二队=results.三星二队
	参数.超鬼王阵容.二星一队=results.二星一队
	参数.超鬼王阵容.二星二队=results.二星二队
	参数.超鬼王阵容.一星一队=results.一星一队
	参数.超鬼王阵容.一星二队=results.一星二队
	参数.当前阵容=''
	参数.切换阵容='阵容1'
	--强力追击
	参数.六星超鬼王强力追击=results.六星超鬼王强力追击.六星
	if 参数.六星超鬼王强力追击 then
		参数.六星超鬼王强力追击血量下限=tonumber(results.六星超鬼王强力追击血量下限)
		参数.六星超鬼王强力追击血量下限=tonumber(results.六星超鬼王强力追击血量下限)
	end
	参数.五星超鬼王强力追击=results.五星超鬼王强力追击.五星
	if 参数.五星超鬼王强力追击 then	
		参数.五星超鬼王强力追击血量下限=tonumber(results.五星超鬼王强力追击血量下限)
		参数.五星超鬼王强力追击血量上限=tonumber(results.五星超鬼王强力追击血量上限)
	end
	参数.四星超鬼王强力追击=results.四星超鬼王强力追击.四星
	if 参数.四星超鬼王强力追击 then	
		参数.四星超鬼王强力追击血量下限=tonumber(results.四星超鬼王强力追击血量下限)
		参数.四星超鬼王强力追击血量上限=tonumber(results.四星超鬼王强力追击血量上限)
	end
	参数.三星超鬼王强力追击=results.三星超鬼王强力追击.三星
	if 参数.三星超鬼王强力追击 then	
		参数.三星超鬼王强力追击血量下限=tonumber(results.三星超鬼王强力追击血量下限)
		参数.三星超鬼王强力追击血量上限=tonumber(results.三星超鬼王强力追击血量上限)
	end
	参数.二星超鬼王强力追击=results.二星超鬼王强力追击.二星
	if 参数.二星超鬼王强力追击 then	
		参数.二星超鬼王强力追击血量下限=tonumber(results.二星超鬼王强力追击血量下限)
		参数.二星超鬼王强力追击血量上限=tonumber(results.二星超鬼王强力追击血量上限)
	end
	参数.一星超鬼王强力追击=results.一星超鬼王强力追击.一星
	if 参数.一星超鬼王强力追击 then	
		参数.一星超鬼王强力追击血量下限=tonumber(results.一星超鬼王强力追击血量下限)
		参数.一星超鬼王强力追击血量上限=tonumber(results.一星超鬼王强力追击血量上限)
	end
	--邀请好友
	参数.超鬼王重设固定好友=results.超鬼王重设固定队友.重设固定队友
	参数.超鬼王固定好友识别度 = tonumber(results.超鬼王固定好友识别度)
	参数.六星超鬼王邀请=results.六星超鬼王邀请.六星邀请
	参数.六星超鬼王邀请血量下限=tonumber(results.六星超鬼王邀请血量下限)
	参数.六星超鬼王邀请血量上限=tonumber(results.六星超鬼王邀请血量上限)
	参数.六星超鬼王邀请目标=results.六星超鬼王邀请目标
	参数.五星超鬼王邀请=results.五星超鬼王邀请.五星邀请
	参数.五星超鬼王邀请血量下限=tonumber(results.五星超鬼王邀请血量下限)
	参数.五星超鬼王邀请血量上限=tonumber(results.五星超鬼王邀请血量上限)
	参数.五星超鬼王邀请目标=results.五星超鬼王邀请目标
	参数.四星超鬼王邀请=results.四星超鬼王邀请.四星邀请
	参数.四星超鬼王邀请血量下限=tonumber(results.四星超鬼王邀请血量下限)
	参数.四星超鬼王邀请血量上限=tonumber(results.四星超鬼王邀请血量上限)
	参数.四星超鬼王邀请目标=results.四星超鬼王邀请目标
	参数.三星超鬼王邀请=results.三星超鬼王邀请.三星邀请
	参数.三星超鬼王邀请血量下限=tonumber(results.三星超鬼王邀请血量下限)
	参数.三星超鬼王邀请血量上限=tonumber(results.三星超鬼王邀请血量上限)
	参数.三星超鬼王邀请目标=results.三星超鬼王邀请目标
	参数.二星超鬼王邀请=results.二星超鬼王邀请.二星邀请
	参数.二星超鬼王邀请血量下限=tonumber(results.二星超鬼王邀请血量下限)
	参数.二星超鬼王邀请血量上限=tonumber(results.二星超鬼王邀请血量上限)
	参数.二星超鬼王邀请目标=results.二星超鬼王邀请目标
	参数.一星超鬼王邀请=results.一星超鬼王邀请.一星邀请
	参数.一星超鬼王邀请血量下限=tonumber(results.一星超鬼王邀请血量下限)
	参数.一星超鬼王邀请血量上限=tonumber(results.一星超鬼王邀请血量上限)
	参数.一星超鬼王邀请目标=results.一星超鬼王邀请目标
	--震动提醒
	参数.超鬼王震动提醒.四星震动提醒=results.超鬼王震动提醒.四星震动提醒
	参数.超鬼王震动提醒.五星震动提醒=results.超鬼王震动提醒.五星震动提醒
	参数.超鬼王震动提醒.六星震动提醒=results.超鬼王震动提醒.六星震动提醒
	--疲劳值满后
	参数.超鬼王疲劳值满后=results.疲劳值满后
	参数.超鬼王等待疲劳度恢复中=false
	if 参数.超鬼王疲劳值满后=='等待疲劳值恢复' then
		参数.超鬼王返回主任务疲劳值=tonumber(results.超鬼王返回主任务疲劳值)
	end
	--发现次数满
	参数.超鬼王发现五十次后切换为主任务=results.超鬼王发现次数满.发现50次后切换超鬼王为主任务
	--识别延时
	参数.超鬼王识别前等待=1000*tonumber(results.识别超鬼王前延时)
	--血线识别误差
	参数.超鬼王血线识别精度=150-tonumber(results.超鬼王血线识别精度)
	if 参数.超鬼王血线识别精度<50 then 
		参数.超鬼王血线识别精度=50
	elseif 参数.超鬼王血线识别精度>100 then
		参数.超鬼王血线识别精度=100
	end
	参数.超鬼王血线识别色域='0xebe6d4-0x'..string.format("%x",tostring(参数.超鬼王血线识别精度))..string.format("%x",tostring(参数.超鬼王血线识别精度))..string.format("%x",tostring(参数.超鬼王血线识别精度))
	参数.超鬼王显示血线=results.超鬼王显示血线.显示血线
--	if results.疲劳值满后=='自动购买' then
--		参数.自动购买疲劳值=true
--	else
--		参数.自动购买疲劳值=false
--		if results.疲劳值满后=='震动提醒' then
--			参数.超鬼王疲劳提醒=true
--		else
--			参数.超鬼王疲劳提醒=false
--		end
--	end
end
if 参数.交叉犬夜叉 then
	------犬夜叉
	--穿插设置
	参数.犬夜叉挤车=results.犬夜叉挤车.挤车
	参数.犬夜叉挤车开金币buff=results.交叉犬夜叉开金币buff.挤车时开启
	参数.犬夜叉自己发现开金币buff=results.交叉犬夜叉开金币buff.自己发现时开启
	if 参数.犬夜叉挤车 then
		参数.主任务=false
		参数.犬夜叉开始计时时刻=-1
	else
		参数.犬夜叉开始计时时刻=2*mTime()
	end
end
if 参数.交叉离岛 then
	参数.主任务 = false
	参数.离岛CD冷却时刻 = -1
	参数.离岛副本 = results.离岛副本
	参数.离岛难度 = results.离岛难度
	参数.离岛点怪 = results.离岛点怪.点怪
	if 参数.离岛点怪 then
		参数.离岛点怪目标 = results.离岛集火目标
	end
	参数.离岛免费泡澡 = results.离岛活力耗尽.泡澡
	参数.离岛消耗勾玉 = results.离岛活力耗尽.消耗勾玉
	参数.离岛汤浴 = results.离岛汤浴
	参数.离岛CD时消耗勾玉 = results.离岛CD时消耗勾玉.澡堂CD时消耗勾玉
end
--------------------


--验证参数
function 验证参数()
	if 参数.任务=='探索' and (参数.探索组队类型=='队长' or 参数.探索组队类型=='单人') then
		if not(参数.探索选怪.经验怪 or 参数.探索选怪.金币怪 or 参数.探索选怪.御魂怪) then
			dialog('请至少选择一种怪物类型！',5)
			return false
		end
		
		if 参数.不上白蛋 and 参数.只上白蛋 then
			dialog('请勿同时选择【不上白蛋】和【只上白蛋】！',5)	
			return false
		end
		
		if 参数.不上改名式神 and 参数.只上改名式神 then
			dialog('请勿同时选择【不上改名式神】和【只上改名式神】！',5)	
			return false
		end
		
	end
	
	if 参数.任务=='探索' and (参数.换狗粮 or 参数.狗粮普攻) then
		local 没选狗粮=false
		if 参数.探索组队类型=='队长' and not(参数.狗粮表.左后) and not(参数.狗粮表.右后) then
			没选狗粮=true
		end
		if 参数.探索组队类型~='队长' and not(参数.狗粮表.左前) and not(参数.狗粮表.中前) and not(参数.狗粮表.右前) then
			没选狗粮=true
		end
		if 没选狗粮 then
			dialog('请选择狗粮的位置！',5)	
			return false
		end
	end
	
	if 参数.任务=='探索' and 参数.换狗粮 and 参数.狗粮稀有度=='N卡' and 参数.只上白蛋 then
		dialog('请勿同时选择【更换N卡】和【只上白蛋】！',5)	
		return false
	end
	
	if 参数.任务=='妖气' then
		if 参数.妖气目标.size==0 then
			dialog('请至少选择一种妖怪！',5)
			return false
		end
		
		if 参数.妖气挤房模式=='排队' and 参数.妖气目标.size>1 then
			dialog('【排队】模式仅支持选择一种妖怪，请重新选择！')
			return false
		end
	end
	
	if 参数.任务=='轮回秘境' and 参数.轮回秘境_使用眼 and 参数.提示信息 then
		dialog('若选择【使用轮回之眼】，请隐藏【提示信息】，否则将出现遮挡！')
		return false
	end
	
	--[[	
	if 参数.交叉寮突破 and 参数.交叉个人突破 then
		dialog('暂不支持同时穿插个人突破和寮突破！',5)	
		return false
	end
	--]]
	return true
end
----

function 检查有效期()
	local curTime = getNetTime()
	local targetTime = os.time({year =2018, month = 10, day =1, hour =0, min =0, sec = 0})
	if curTime >= targetTime then
		dialog("当前版本【v"..curVersion.."】已超出使用期，请安装新版本。！", 15)
		lua_exit() 
	end
end

function 检查引擎()
	ver = getEngineVersion()
	ver=string.gsub(ver,'%.','')+0
	if ver<1830 then
		dialog("检测到您的引擎版本过低！“呵呵哒”已经升级为最新的识别技术，需要1.8.30以上的叉叉引擎支持，请重新下载最新版叉叉后使用！", 15)
		lua_exit() 
	end
end

--执行任务
if not(验证参数()) then
	ui = 生成界面()
	ret,results = ui:show()
	if ret == 0 then lua_exit() end
	初始化并启动()
elseif ret==1 then
    --检查有效期()
	检查引擎()
	setScreenScale(640,1136)
--	参数.寮突破间隔=10000
--	参数.个人突破间隔=10000
--	参数.犬夜叉开始计时时刻=9999999999999999999
	执行任务.设置流程()
	执行任务.启动任务()
	
--		参数.超鬼王中=true
--		参数.主任务=false
--		执行任务.设置交叉超鬼王流程()
--		执行任务.超鬼王()
	
--	执行任务.设置登录游戏流程()
--	参数.切换阵容=1
--	参数.主任务=false
--	return 执行任务.登录游戏()
end
----

end


初始化并启动()



