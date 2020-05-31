-----------任务函数-----------
执行任务={设置流程,启动任务,重新识别,等待邀请={等待,Next}}  
----

-----------设置流程-----------
function 执行任务.设置流程()
	if 参数.任务=='大蛇' and 参数.组队方式~='队员' then  -- 大蛇-单人/队长
		执行任务.重新识别=执行任务.大蛇
		执行任务.主任务=执行任务.大蛇
		庭院界面.Next=探索界面.to御魂界面
		探索界面.Next=御魂界面.to大蛇界面
		if 参数.组队方式=='单人' then
			御魂界面.Next=大蛇界面.to战斗准备界面
			大蛇界面.Next=战斗准备界面.to战斗界面
			战斗准备界面.Next=战斗界面.to战斗胜利界面
			战斗界面.Next=战斗胜利界面.to战斗结算界面2
			战斗胜利界面.Next=战斗结算界面2.to大蛇界面
			战斗结算界面1.Next=战斗结算界面2.to大蛇界面
			战斗结算界面2.Next=大蛇界面.to战斗准备界面	
			战斗结算界面3.Next=大蛇界面.to战斗准备界面
			战斗失败界面.Next=大蛇界面.to战斗准备界面
		else
			御魂界面.Next=大蛇界面.to组队界面
			大蛇界面.Next=组队界面.to创建队伍界面
			组队界面.Next=创建队伍界面.to房间界面
			创建队伍界面.Next=房间界面.to战斗准备界面
			战斗准备界面.Next=战斗界面.to战斗胜利界面
			战斗界面.Next=战斗胜利界面.to战斗结算界面2
			if 参数.默认邀请队友 then
				房间界面.Next=战斗界面.to战斗胜利界面
				战斗胜利界面.Next=战斗结算界面2.to房间界面
				战斗结算界面1.Next=战斗结算界面2.to房间界面
				战斗结算界面2.Next=房间界面.to战斗准备界面
				战斗结算界面3.Next=房间界面.to战斗准备界面
				重邀界面.Next=房间界面.to战斗准备界面
			else
				房间界面.Next=战斗准备界面.to战斗界面
				战斗胜利界面.Next=战斗结算界面2.to重邀界面		
				战斗结算界面1.Next=战斗结算界面2.to重邀界面
				战斗结算界面2.Next=重邀界面.to房间界面	
				战斗结算界面3.Next=重邀界面.to房间界面
				重邀界面.Next=房间界面.to战斗准备界面
			end
			if 参数.失败重邀 then 
				战斗失败界面.Next=重邀界面.to房间界面
			else 
				战斗失败界面.Next=重邀界面.to探索界面
			end
			房间退出界面.Next=创建队伍界面.to房间界面
			房间邀请界面.Next=房间界面.to战斗准备界面
		end
		真蛇界面.Next=探索界面.to御魂界面
		探索准备界面.Next=探索界面.to御魂界面
		换狗粮界面.Next=战斗准备界面.to战斗界面
		
	elseif 参数.任务=='大蛇'  and 参数.组队方式=='队员' then -- 大蛇-队员
		执行任务.重新识别=执行任务.大蛇队员
		执行任务.主任务=执行任务.大蛇队员
		执行任务.等待邀请.Next=房间界面.to战斗准备界面（队员）
		战斗准备界面.Next=战斗界面.to战斗胜利界面
		战斗界面.Next=战斗胜利界面.to战斗结算界面2
		战斗胜利界面.Next=战斗结算界面2.领奖
		战斗失败界面.Next=执行任务.等待邀请.等待
		战斗结算界面1.Next=战斗结算界面2.领奖
		if not(参数.默认接受邀请) then
			房间界面.Next=战斗准备界面.to战斗界面
			战斗结算界面2.Next=执行任务.等待邀请.等待
			战斗结算界面3.Next=执行任务.等待邀请.等待
		else
			房间界面.Next=战斗界面.to战斗胜利界面
			战斗结算界面2.Next=房间界面.to战斗准备界面（队员）
			战斗结算界面3.Next=房间界面.to战斗准备界面（队员）
		end
		房间退出界面.Next=执行任务.等待邀请.等待
		房间邀请界面.Next=房间界面.to战斗准备界面（队员）
		换狗粮界面.Next=战斗准备界面.to战斗界面
		
	elseif 参数.任务=='卑弥呼' and 参数.组队方式~='队员' then  -- 卑弥呼-单人/队长
		执行任务.重新识别=执行任务.卑弥呼
		执行任务.主任务=执行任务.卑弥呼
		庭院界面.Next=探索界面.to御魂界面
		探索界面.Next=御魂界面.to卑弥呼界面
		if 参数.组队方式=='单人' then
			御魂界面.Next=卑弥呼界面.to战斗准备界面
			卑弥呼界面.Next=战斗准备界面.to战斗界面
			战斗准备界面.Next=战斗界面.to战斗胜利界面
			战斗界面.Next=战斗胜利界面.to战斗结算界面2
			战斗胜利界面.Next=战斗结算界面2.to卑弥呼界面
			战斗结算界面1.Next=战斗结算界面2.to卑弥呼界面
			战斗结算界面2.Next=卑弥呼界面.to战斗准备界面	
			战斗结算界面3.Next=卑弥呼界面.to战斗准备界面
			战斗失败界面.Next=卑弥呼界面.to战斗准备界面
		else
			御魂界面.Next=卑弥呼界面.to组队界面
			卑弥呼界面.Next=组队界面.to创建队伍界面
			组队界面.Next=创建队伍界面.to房间界面
			创建队伍界面.Next=房间界面.to战斗准备界面
			战斗准备界面.Next=战斗界面.to战斗胜利界面
			战斗界面.Next=战斗胜利界面.to战斗结算界面2
			if 参数.默认邀请队友 then
				房间界面.Next=战斗界面.to战斗胜利界面
				战斗胜利界面.Next=战斗结算界面2.to房间界面
				战斗结算界面1.Next=战斗结算界面2.to房间界面
				战斗结算界面2.Next=房间界面.to战斗准备界面
				战斗结算界面3.Next=房间界面.to战斗准备界面
				重邀界面.Next=房间界面.to战斗准备界面
			else
				房间界面.Next=战斗准备界面.to战斗界面
				战斗胜利界面.Next=战斗结算界面2.to重邀界面		
				战斗结算界面1.Next=战斗结算界面2.to重邀界面
				战斗结算界面2.Next=重邀界面.to房间界面	
				战斗结算界面3.Next=重邀界面.to房间界面
				重邀界面.Next=房间界面.to战斗准备界面
			end
			if 参数.失败重邀 then 
				战斗失败界面.Next=重邀界面.to房间界面
			else 
				战斗失败界面.Next=重邀界面.to探索界面
			end
			房间退出界面.Next=创建队伍界面.to房间界面
			房间邀请界面.Next=房间界面.to战斗准备界面
		end
		真蛇界面.Next=探索界面.to御魂界面
		探索准备界面.Next=探索界面.to御魂界面
		换狗粮界面.Next=战斗准备界面.to战斗界面
		
	elseif 参数.任务=='卑弥呼'  and 参数.组队方式=='队员' then -- 卑弥呼-队员
		执行任务.重新识别=执行任务.卑弥呼队员
		执行任务.主任务=执行任务.卑弥呼队员
		执行任务.等待邀请.Next=房间界面.to战斗准备界面（队员）
		战斗准备界面.Next=战斗界面.to战斗胜利界面
		战斗界面.Next=战斗胜利界面.to战斗结算界面2
		战斗胜利界面.Next=战斗结算界面2.领奖
		战斗失败界面.Next=执行任务.等待邀请.等待
		战斗结算界面1.Next=战斗结算界面2.领奖
		if not 参数.默认接受邀请 then
			房间界面.Next=战斗准备界面.to战斗界面
			战斗结算界面2.Next=执行任务.等待邀请.等待
			战斗结算界面3.Next=执行任务.等待邀请.等待
		else
			房间界面.Next=战斗界面.to战斗胜利界面
			战斗结算界面2.Next=房间界面.to战斗准备界面（队员）
			战斗结算界面3.Next=房间界面.to战斗准备界面（队员）
		end
		房间退出界面.Next=执行任务.等待邀请.等待
		房间邀请界面.Next=房间界面.to战斗准备界面（队员）
		换狗粮界面.Next=战斗准备界面.to战斗界面
	
	elseif 参数.任务=='觉醒' and 参数.组队方式~='队员' then  -- 觉醒-单人/队长
		执行任务.重新识别=执行任务.觉醒
		执行任务.主任务=执行任务.觉醒
		庭院界面.Next=探索界面.to觉醒界面
		探索界面.Next=觉醒界面.to麒麟界面
		if 参数.组队方式=='单人' then
			觉醒界面.Next=麒麟界面.to战斗准备界面
			麒麟界面.Next=战斗准备界面.to战斗界面
			战斗准备界面.Next=战斗界面.to战斗胜利界面
			战斗界面.Next=战斗胜利界面.to战斗结算界面2
			战斗胜利界面.Next=战斗结算界面2.to麒麟界面
			战斗结算界面1.Next=战斗结算界面2.to麒麟界面
			战斗结算界面2.Next=麒麟界面.to战斗准备界面	
			战斗结算界面3.Next=麒麟界面.to战斗准备界面
			战斗失败界面.Next=麒麟界面.to战斗准备界面
			重邀界面.Next=执行任务.重新识别
		else
			觉醒界面.Next=麒麟界面.to组队界面
			麒麟界面.Next=组队界面.to创建队伍界面
			组队界面.Next=创建队伍界面.to房间界面
			创建队伍界面.Next=房间界面.to战斗准备界面
			战斗准备界面.Next=战斗界面.to战斗胜利界面
			战斗界面.Next=战斗胜利界面.to战斗结算界面2
			if 参数.默认邀请队友 then
				房间界面.Next=战斗界面.to战斗胜利界面
				战斗胜利界面.Next=战斗结算界面2.to房间界面
				战斗结算界面1.Next=战斗结算界面2.to房间界面
				战斗结算界面2.Next=房间界面.to战斗准备界面
				战斗结算界面3.Next=房间界面.to战斗准备界面
				重邀界面.Next=房间界面.to战斗准备界面
			else
				房间界面.Next=战斗准备界面.to战斗界面
				战斗胜利界面.Next=战斗结算界面2.to重邀界面		
				战斗结算界面1.Next=战斗结算界面2.to重邀界面
				战斗结算界面2.Next=重邀界面.to房间界面	
				战斗结算界面3.Next=重邀界面.to房间界面
				重邀界面.Next=房间界面.to战斗准备界面
			end
			if 参数.失败重邀 then 
				战斗失败界面.Next=重邀界面.to房间界面
			else 
				战斗失败界面.Next=重邀界面.to探索界面
			end
			房间退出界面.Next=创建队伍界面.to房间界面
			房间邀请界面.Next=房间界面.to战斗准备界面
		end
		探索准备界面.Next=探索界面.to觉醒界面
	elseif 参数.任务=='觉醒'  and 参数.组队方式=='队员' then -- 觉醒-队员
		执行任务.重新识别=执行任务.觉醒队员
		执行任务.主任务=执行任务.觉醒队员
		执行任务.等待邀请.Next=房间界面.to战斗准备界面（队员）
		房间界面.Next=战斗准备界面.to战斗界面
		战斗准备界面.Next=战斗界面.to战斗胜利界面
		战斗界面.Next=战斗胜利界面.to战斗结算界面2
		战斗胜利界面.Next=战斗结算界面2.领奖
		战斗失败界面.Next=执行任务.等待邀请.等待
		战斗结算界面1.Next=战斗结算界面2.领奖
		if not(参数.默认接受邀请) then
			房间界面.Next=战斗准备界面.to战斗界面
			战斗结算界面2.Next=执行任务.等待邀请.等待
			战斗结算界面3.Next=执行任务.等待邀请.等待
		else
			房间界面.Next=战斗界面.to战斗胜利界面
			战斗结算界面2.Next=房间界面.to战斗准备界面（队员）
			战斗结算界面3.Next=房间界面.to战斗准备界面（队员）
		end
		房间退出界面.Next=执行任务.等待邀请.等待
		房间邀请界面.Next=房间界面.to战斗准备界面（队员）
	elseif 参数.任务=='探索' and  参数.探索组队类型~='队员' then -- 探索-单人/队长
		执行任务.重新识别=执行任务.探索
		执行任务.主任务=执行任务.探索
		庭院界面.Next=探索界面.to探索准备界面
		探索界面.Next=探索准备界面.to探索关卡界面
		if 参数.探索组队类型=='单人' then
			探索准备界面.Next=探索关卡界面.to战斗准备界面
			探索关卡退出界面.Next=探索准备界面.to探索关卡界面
		elseif 参数.探索组队类型=='队长' then
			探索准备界面.Next = 探索创建队伍界面.to房间界面
			探索创建队伍界面.Next = 房间界面.to探索关卡界面
			房间界面.Next = 探索关卡界面.to战斗准备界面
			探索关卡退出界面.Next=重邀界面.to探索邀请界面
			重邀界面.Next=房间界面.to探索关卡界面
		end
		探索关卡界面.Next=战斗准备界面.to战斗界面
		战斗准备界面.Next=战斗界面.to战斗胜利界面
		战斗界面.Next=战斗胜利界面.to战斗结算界面2
		战斗胜利界面.Next=战斗结算界面2.to探索关卡界面
		战斗结算界面1.Next=战斗结算界面2.to探索关卡界面
		战斗结算界面2.Next=探索关卡界面.to战斗准备界面
		战斗结算界面3.Next=探索关卡界面.to战斗准备界面
		战斗失败界面.Next=探索关卡界面.to战斗准备界面
		换狗粮界面.Next=战斗准备界面.to战斗界面
		房间邀请界面.Next=房间界面.to探索关卡界面
	elseif 参数.任务=='探索' and  参数.探索组队类型=='队员' then -- 探索-队员
		执行任务.重新识别=执行任务.探索队员
		执行任务.主任务=执行任务.探索队员
		执行任务.等待邀请.Next = 房间界面.to探索关卡界面（队员）
		房间界面.Next = 探索关卡界面.to战斗准备界面（队员）
		探索关卡界面.Next=战斗准备界面.to战斗界面
		战斗准备界面.Next=战斗界面.to战斗胜利界面
		战斗界面.Next=战斗胜利界面.to战斗结算界面2
		战斗胜利界面.Next=战斗结算界面2.to探索关卡界面
		战斗结算界面1.Next=战斗结算界面2.to探索关卡界面
		战斗结算界面2.Next=探索关卡界面.to战斗准备界面（队员）
		战斗结算界面3.Next=探索关卡界面.to战斗准备界面（队员）
		战斗失败界面.Next=探索关卡界面.to战斗准备界面（队员）
		换狗粮界面.Next=战斗准备界面.to战斗界面
		探索关卡退出界面.Next=探索准备界面.to探索界面
		探索准备界面.Next=执行任务.等待邀请.等待
	elseif 参数.任务=='突破' and 参数.突破方式=='个人突破' then -- 个人突破
		执行任务.重新识别=执行任务.个人突破
		执行任务.主任务=执行任务.个人突破
		庭院界面.Next=探索界面.to个人突破界面
		探索界面.Next=个人突破界面.to个人突破准备界面
		个人突破界面.Next=个人突破准备界面.to战斗准备界面
		个人突破准备界面.Next=战斗准备界面.to战斗界面
		战斗准备界面.Next=战斗界面.to战斗胜利界面
		战斗界面.Next=战斗胜利界面.to战斗结算界面2
		战斗胜利界面.Next=战斗结算界面2.to个人突破界面		
		战斗结算界面1.Next=战斗结算界面2.to个人突破界面
		战斗结算界面2.Next=个人突破界面.to个人突破准备界面	
		战斗结算界面3.Next=个人突破界面.to个人突破准备界面
		战斗失败界面.Next=个人突破界面.to个人突破准备界面
		探索准备界面.Next=探索界面.to个人突破界面
		
	elseif 参数.任务=='突破' and 参数.突破方式=='寮突破' then --寮突破
		执行任务.重新识别=执行任务.寮突破
		执行任务.主任务=执行任务.寮突破
		庭院界面.Next=探索界面.to个人突破界面
		探索界面.Next=个人突破界面.to寮突破界面
		个人突破界面.Next=寮突破界面.to寮突破准备界面
		寮突破界面.Next=寮突破准备界面.to战斗准备界面
		寮突破准备界面.Next=战斗准备界面.to战斗界面
		战斗准备界面.Next=战斗界面.to战斗胜利界面
		战斗界面.Next=战斗胜利界面.to战斗结算界面2
		战斗胜利界面.Next=战斗结算界面2.to寮突破界面		
		战斗结算界面1.Next=战斗结算界面2.to寮突破界面
		战斗结算界面2.Next=寮突破界面.to寮突破准备界面	
		战斗结算界面3.Next=寮突破界面.to寮突破准备界面
		战斗失败界面.Next=寮突破界面.to寮突破准备界面
		探索准备界面.Next=探索界面.to个人突破界面
		
	elseif 参数.任务=='业原火' then                        -- 业原火
		执行任务.重新识别=执行任务.业原火
		执行任务.主任务=执行任务.业原火
		庭院界面.Next=探索界面.to御魂界面
		探索界面.Next=御魂界面.to业原火界面
		御魂界面.Next=业原火界面.to战斗准备界面
		业原火界面.Next=战斗准备界面.to战斗界面
		战斗准备界面.Next=战斗界面.to战斗胜利界面
		战斗界面.Next=战斗胜利界面.to战斗结算界面2
		战斗胜利界面.Next=战斗结算界面2.to业原火界面	
		战斗结算界面1.Next=战斗结算界面2.to业原火界面
		战斗结算界面2.Next=业原火界面.to战斗准备界面	
		战斗结算界面3.Next=业原火界面.to战斗准备界面
		战斗失败界面.Next=业原火界面.to战斗准备界面
		探索准备界面.Next=探索界面.to御魂界面
		换狗粮界面.Next=战斗准备界面.to战斗界面
		
	elseif 参数.任务=='御灵' then                        -- 御灵
		执行任务.重新识别=执行任务.御灵
		执行任务.主任务=执行任务.御灵
		庭院界面.Next=探索界面.to御灵界面
		探索界面.Next=御灵界面.to神兽界面
		御灵界面.Next=神兽界面.to战斗准备界面
		神兽界面.Next=战斗准备界面.to战斗界面
		战斗准备界面.Next=战斗界面.to战斗胜利界面
		战斗界面.Next=战斗胜利界面.to战斗结算界面2
		战斗胜利界面.Next=战斗结算界面2.to神兽界面	
		战斗结算界面1.Next=战斗结算界面2.to神兽界面
		战斗结算界面2.Next=神兽界面.to战斗准备界面	
		战斗结算界面3.Next=神兽界面.to战斗准备界面
		战斗失败界面.Next=神兽界面.to战斗准备界面
		探索准备界面.Next=探索界面.to御灵界面
		
	elseif 参数.任务=='妖气' then                        --妖气
		执行任务.重新识别=执行任务.妖气
		执行任务.主任务=执行任务.妖气
		庭院界面.Next=组队界面.to房间界面
		组队界面.Next = 参数.妖气挤房模式 == '排队' and 庭院界面.to组队界面 
						or 房间界面.to战斗准备界面（队员）
		房间界面.Next=战斗准备界面.to战斗界面
		战斗准备界面.Next=战斗界面.to战斗胜利界面
		战斗界面.Next=战斗胜利界面.to战斗结算界面2
		战斗胜利界面.Next=战斗结算界面2.to庭院界面
		战斗结算界面1.Next=战斗结算界面2.to庭院界面
		战斗结算界面2.Next=庭院界面.to组队界面
		战斗结算界面3.Next=庭院界面.to组队界面
		战斗失败界面.Next=庭院界面.to组队界面
		探索界面.Next=庭院界面.to组队界面
		探索准备界面.Next=探索界面.to庭院界面
		
	elseif 参数.任务=='死神' then
		执行任务.重新识别=执行任务.死神
		执行任务.主任务=执行任务.死神
		庭院界面.Next=组队界面.to房间界面2
		组队界面.Next=房间界面.to战斗准备界面（队员）
		房间界面.Next=战斗准备界面.to战斗界面
		战斗准备界面.Next=战斗界面.to战斗胜利界面
		战斗界面.Next=战斗胜利界面.to战斗结算界面2
		战斗胜利界面.Next=战斗结算界面2.to庭院界面
		战斗结算界面1.Next=战斗结算界面2.to庭院界面
		战斗结算界面2.Next=庭院界面.to组队界面
		战斗结算界面3.Next=庭院界面.to组队界面
		战斗失败界面.Next=庭院界面.to组队界面
		探索界面.Next=庭院界面.to组队界面
		探索准备界面.Next=探索界面.to庭院界面
		
	elseif 参数.任务=='超鬼王' then
		执行任务.重新识别=执行任务.超鬼王（主）
		执行任务.主任务=执行任务.超鬼王（主）
		庭院界面.Next=执行任务.切换超鬼王
		探索界面.Next=执行任务.切换超鬼王
		
	elseif 参数.任务=='修罗战场' then
		执行任务.重新识别 = 执行任务.修罗战场
		执行任务.主任务 = 执行任务.修罗战场
		探索界面.Next = 庭院界面.to大江山之战界面
		庭院界面.Next = 大江山之战界面.to修罗战场界面
		大江山之战界面.Next = 修罗战场界面.to战斗准备界面
		修罗战场界面.Next = 战斗准备界面.to战斗界面
		战斗准备界面.Next = 战斗界面.to战斗胜利界面
		战斗界面.Next=战斗胜利界面.to战斗结算界面2
		战斗胜利界面.Next=战斗结算界面2.to修罗战场界面
		战斗结算界面1.Next=战斗结算界面2.to修罗战场界面
		战斗结算界面2.Next=修罗战场界面.to战斗准备界面
		战斗结算界面3.Next=修罗战场界面.to战斗准备界面
		战斗失败界面.Next=修罗战场界面.to战斗准备界面
		大江山宝库界面.Next = 大江山之战界面.to修罗战场界面
		源氏藏兵阁界面.Next = 大江山之战界面.to修罗战场界面
		
	elseif 参数.任务 == '海国退治' then
		执行任务.重新识别 = 执行任务.海国退治
		执行任务.主任务 = 执行任务.海国退治
		探索界面.Next = 庭院界面.to大江山之战界面
		庭院界面.Next = 大江山之战界面.to海国退治界面
		大江山之战界面.Next = 海国退治界面.to战斗准备界面
		海国退治界面.Next = 战斗准备界面.to战斗界面
		战斗准备界面.Next = 战斗界面.to战斗胜利界面
		战斗界面.Next = 战斗结束界面.to海国退治界面
		战斗结束界面.Next = 海国退治界面.to战斗准备界面
		战斗结算界面1.Next = 战斗结算界面2.to战斗结束界面
		战斗结算界面2.Next = 战斗结束界面.to海国退治界面
		战斗结算界面3.Next = 战斗结束界面.to海国退治界面
		大江山宝库界面.Next = 大江山之战界面.to海国退治界面
		源氏藏兵阁界面.Next = 大江山之战界面.to海国退治界面
		战斗退出界面.Next = 战斗结束界面.to海国退治界面
		
	elseif 参数.任务=='离岛之歌' then
		执行任务.重新识别 = 执行任务.离岛之歌
		执行任务.主任务 = 执行任务.离岛之歌
		探索界面.Next = 庭院界面.to离岛界面
		庭院界面.Next = 离岛界面.to道场（居酒屋）界面
		离岛界面.Next = 道场（居酒屋）界面.to战斗准备界面
		道场（居酒屋）界面.Next = 战斗准备界面.to战斗界面
		战斗准备界面.Next = 战斗界面.to战斗胜利界面
		战斗界面.Next = 战斗胜利界面.to战斗结算界面2
		战斗胜利界面.Next = 战斗结算界面2.to道场（居酒屋）界面
		战斗结算界面1.Next = 战斗结算界面2.to道场（居酒屋）界面
		战斗结算界面2.Next = 道场（居酒屋）界面.to战斗准备界面
		战斗结算界面3.Next = 道场（居酒屋）界面.to战斗准备界面
		战斗失败界面.Next = 道场（居酒屋）界面.to战斗准备界面
		
	elseif 参数.任务=='轮回秘境' then
		执行任务.重新识别 = 执行任务.轮回秘境
		执行任务.主任务 = 执行任务.轮回秘境
		探索界面.Next = 庭院界面.to瞭望塔界面
		庭院界面.Next = 瞭望塔界面.to轮回秘境界面
		瞭望塔界面.Next = 轮回秘境界面.to轮回秘境准备界面
		轮回秘境界面.Next = 轮回秘境准备界面.to战斗准备界面
		轮回秘境准备界面.Next = 战斗准备界面.to战斗界面
		战斗准备界面.Next = 战斗界面.to战斗胜利界面
		战斗界面.Next = 战斗胜利界面.to战斗结算界面2
		战斗胜利界面.Next = 战斗结算界面2.to轮回秘境界面
		战斗结算界面1.Next = 战斗结算界面2.to轮回秘境界面
		战斗结算界面2.Next = 轮回秘境界面.to轮回秘境准备界面
		战斗结算界面3.Next = 轮回秘境界面.to轮回秘境准备界面
		战斗失败界面.Next = 轮回秘境界面.to轮回秘境准备界面
		轮回秘境下一层确认界面.Next = 轮回秘境选择资源界面.to轮回秘境界面
		轮回秘境选择资源界面.Next = 轮回秘境界面.to轮回秘境准备界面
		
	elseif 参数.任务=='狗粮升星' then
		执行任务.重新识别 = 执行任务.狗粮升星
		执行任务.主任务 = 执行任务.狗粮升星
		探索界面.Next = 庭院界面.to式神录界面
		庭院界面.Next = 式神录界面.to育成界面
		if not 参数.狗粮升星_继续升星 then
			式神录界面.Next = 育成界面.to式神录界面
			育成界面.Next = 式神录界面.to育成界面
			星级提升界面.Next = 式神录界面.to育成界面
		else
			式神录界面.Next = 育成界面.to星级提升界面
			育成界面.Next = 星级提升界面.to育成界面
			星级提升界面.Next = 育成界面.to星级提升界面
		end
		
	elseif 参数.任务=='抽厕纸' then
		执行任务.重新识别 = 执行任务.抽厕纸
		执行任务.主任务 = 执行任务.抽厕纸
		探索界面.Next = 庭院界面.to召唤界面
		庭院界面.Next = 召唤界面.to抽N卡界面
		召唤界面.Next = 抽N卡界面.to抽N卡完成界面
		抽N卡界面.Next = 抽N卡完成界面.to抽N卡界面
		抽N卡完成界面.Next = 抽N卡界面.to抽N卡完成界面
		召唤准备界面.Next = 召唤界面.to抽N卡界面
	
	end
	
end

function 执行任务.设置交叉寮突破流程()
	执行任务.重新识别=执行任务.寮突破
	庭院界面.Next=探索界面.to个人突破界面
	探索界面.Next=个人突破界面.to寮突破界面
	个人突破界面.Next=寮突破界面.to寮突破准备界面
	寮突破界面.Next=寮突破准备界面.to战斗准备界面
	寮突破准备界面.Next=战斗准备界面.to战斗界面
	战斗准备界面.Next=战斗界面.to战斗胜利界面
	战斗界面.Next=战斗胜利界面.to战斗结算界面2
	战斗胜利界面.Next=战斗结算界面2.to寮突破界面		
	战斗结算界面1.Next=战斗结算界面2.to寮突破界面
	战斗结算界面2.Next=寮突破界面.to寮突破准备界面	
	战斗结算界面3.Next=寮突破界面.to寮突破准备界面
	战斗失败界面.Next=寮突破界面.to寮突破准备界面
	房间界面.Next=探索界面.to个人突破界面
	if 参数.任务=='大蛇' then
		创建队伍界面.Next=组队界面.to大蛇界面
		组队界面.Next=大蛇界面.to探索界面
	elseif 参数.任务=='觉醒' then
		创建队伍界面.Next=组队界面.to麒麟界面
		组队界面.Next=麒麟界面.to探索界面
	elseif 参数.任务=="卑弥呼" then
		创建队伍界面.Next=组队界面.to卑弥呼界面
		组队界面.Next=卑弥呼界面.to探索界面
	else --妖气、鬼王
		创建队伍界面.Next=组队界面.to庭院界面
		组队界面.Next=庭院界面.to探索界面
	end
	大蛇界面.Next=探索界面.to个人突破界面
	业原火界面.Next=探索界面.to个人突破界面
	麒麟界面.Next=探索界面.to个人突破界面
	神兽界面.Next=探索界面.to个人突破界面
	修罗战场界面.Next=大江山之战界面.to庭院界面
	大江山之战界面.Next=庭院界面.to探索界面
	海国退治界面.Next = 大江山之战界面.to庭院界面
	离岛界面.Next=庭院界面.to探索界面
	道场（居酒屋）界面.Next=离岛界面.to庭院界面
	浮世澡堂界面.Next=离岛界面.to庭院界面
end

function 执行任务.设置交叉个人突破流程()
	执行任务.重新识别=执行任务.个人突破
	庭院界面.Next=探索界面.to个人突破界面
	探索界面.Next=个人突破界面.to个人突破准备界面
	个人突破界面.Next=个人突破准备界面.to战斗准备界面
	个人突破准备界面.Next=战斗准备界面.to战斗界面
	战斗准备界面.Next=战斗界面.to战斗胜利界面
	战斗界面.Next=战斗胜利界面.to战斗结算界面2
	战斗胜利界面.Next=战斗结算界面2.to个人突破界面		
	战斗结算界面1.Next=战斗结算界面2.to个人突破界面
	战斗结算界面2.Next=个人突破界面.to个人突破准备界面	
	战斗结算界面3.Next=个人突破界面.to个人突破准备界面
	战斗失败界面.Next=个人突破界面.to个人突破准备界面
	房间界面.Next=探索界面.to个人突破界面
	if 参数.任务=='大蛇' then
		创建队伍界面.Next=组队界面.to大蛇界面
		组队界面.Next=大蛇界面.to探索界面
	elseif 参数.任务=='觉醒' then
		创建队伍界面.Next=组队界面.to麒麟界面
		组队界面.Next=麒麟界面.to探索界面
	elseif 参数.任务=="卑弥呼" then
		创建队伍界面.Next=组队界面.to卑弥呼界面
		组队界面.Next=卑弥呼界面.to探索界面
	else
		创建队伍界面.Next=组队界面.to庭院界面
		组队界面.Next=庭院界面.to探索界面
	end
	大蛇界面.Next=探索界面.to个人突破界面
	业原火界面.Next=探索界面.to个人突破界面
	麒麟界面.Next=探索界面.to个人突破界面
	神兽界面.Next=探索界面.to个人突破界面
	修罗战场界面.Next=大江山之战界面.to庭院界面
	大江山之战界面.Next=庭院界面.to探索界面
	海国退治界面.Next = 大江山之战界面.to庭院界面
	离岛界面.Next=庭院界面.to探索界面
	道场（居酒屋）界面.Next=离岛界面.to庭院界面
	浮世澡堂界面.Next=离岛界面.to庭院界面
end

function 执行任务.设置交叉离岛流程()
	执行任务.重新识别=执行任务.离岛之歌
	探索界面.Next = 庭院界面.to离岛界面
	庭院界面.Next = 离岛界面.to道场（居酒屋）界面
	离岛界面.Next = 道场（居酒屋）界面.to战斗准备界面
	道场（居酒屋）界面.Next = 战斗准备界面.to战斗界面
	战斗准备界面.Next = 战斗界面.to战斗胜利界面
	战斗界面.Next = 战斗胜利界面.to战斗结算界面2
	战斗胜利界面.Next = 战斗结算界面2.to道场（居酒屋）界面
	战斗结算界面1.Next = 战斗结算界面2.to道场（居酒屋）界面
	战斗结算界面2.Next = 道场（居酒屋）界面.to战斗准备界面
	战斗结算界面3.Next = 道场（居酒屋）界面.to战斗准备界面
	战斗失败界面.Next = 道场（居酒屋）界面.to战斗准备界面
	房间界面.Next=探索界面.to庭院界面
	--浮世澡堂界面.Next = 
	if 参数.任务=='大蛇' then
		创建队伍界面.Next=组队界面.to大蛇界面
		组队界面.Next=大蛇界面.to探索界面
	elseif 参数.任务=='觉醒' then
		创建队伍界面.Next=组队界面.to麒麟界面
		组队界面.Next=麒麟界面.to探索界面
	elseif 参数.任务=="卑弥呼" then
		创建队伍界面.Next=组队界面.to卑弥呼界面
		组队界面.Next=卑弥呼界面.to探索界面
	else
		创建队伍界面.Next=组队界面.to庭院界面
		组队界面.Next=庭院界面.to离岛界面
	end
	大蛇界面.Next=探索界面.to庭院界面
	业原火界面.Next=探索界面.to庭院界面
	麒麟界面.Next=探索界面.to庭院界面
	神兽界面.Next=探索界面.to庭院界面
end

function 执行任务.设置交叉死神流程()
	执行任务.重新识别=执行任务.死神
	庭院界面.Next=组队界面.to房间界面2
	组队界面.Next=房间界面.to战斗准备界面（队员）
	房间界面.Next=战斗准备界面.to战斗界面
	战斗准备界面.Next=战斗界面.to战斗胜利界面
	战斗界面.Next=战斗胜利界面.to战斗结算界面2
	战斗胜利界面.Next=战斗结算界面2.to庭院界面
	战斗结算界面1.Next=战斗结算界面2.to庭院界面
	战斗结算界面2.Next=庭院界面.to组队界面
	战斗结算界面3.Next=庭院界面.to组队界面
	战斗失败界面.Next=庭院界面.to组队界面
	探索界面.Next=庭院界面.to组队界面
	探索准备界面.Next=探索界面.to庭院界面
	if 参数.任务=='大蛇' then
		创建队伍界面.Next=组队界面.to大蛇界面
		组队界面.Next=大蛇界面.to探索界面
	elseif 参数.任务=='觉醒' then
		创建队伍界面.Next=组队界面.to麒麟界面
		组队界面.Next=麒麟界面.to探索界面
	elseif 参数.任务=="卑弥呼" then
		创建队伍界面.Next=组队界面.to卑弥呼界面
		组队界面.Next=卑弥呼界面.to探索界面
	else
		创建队伍界面.Next=组队界面.to探索界面
		组队界面.Next=庭院界面.to组队界面
	end
	大蛇界面.Next=探索界面.to庭院界面
	业原火界面.Next=探索界面.to庭院界面
	麒麟界面.Next=探索界面.to庭院界面
	神兽界面.Next=探索界面.to庭院界面
	鬼王界面.Next=鬼王创建队伍界面.to房间界面
	鬼王创建队伍界面.Next=房间界面.to战斗准备界面（队员）
end

function 执行任务.设置交叉年兽流程()
	执行任务.重新识别=执行任务.年兽
	庭院界面.Next=组队界面.to房间界面2
	组队界面.Next=房间界面.to战斗准备界面（队员）
	房间界面.Next=战斗准备界面.to战斗界面
	战斗准备界面.Next=战斗界面.to战斗胜利界面
	战斗界面.Next=战斗胜利界面.to战斗结算界面2
	战斗胜利界面.Next=战斗结算界面2.to庭院界面
	战斗结算界面1.Next=战斗结算界面2.to庭院界面
	战斗结算界面2.Next=庭院界面.to组队界面
	战斗结算界面3.Next=庭院界面.to组队界面
	战斗失败界面.Next=庭院界面.to组队界面
	探索界面.Next=庭院界面.to组队界面
	探索准备界面.Next=探索界面.to庭院界面
	if 参数.任务=='大蛇' then
		创建队伍界面.Next=组队界面.to大蛇界面
		组队界面.Next=大蛇界面.to探索界面
	elseif 参数.任务=='觉醒' then
		创建队伍界面.Next=组队界面.to麒麟界面
		组队界面.Next=麒麟界面.to探索界面
	elseif 参数.任务=="卑弥呼" then
		创建队伍界面.Next=组队界面.to卑弥呼界面
		组队界面.Next=卑弥呼界面.to探索界面
	else
		创建队伍界面.Next=组队界面.to探索界面
		组队界面.Next=庭院界面.to组队界面
	end
	大蛇界面.Next=探索界面.to庭院界面
	业原火界面.Next=探索界面.to庭院界面
	麒麟界面.Next=探索界面.to庭院界面
	神兽界面.Next=探索界面.to庭院界面
	年兽界面.Next=鬼王创建队伍界面.to房间界面
	鬼王创建队伍界面.Next=房间界面.to战斗准备界面（队员）
	修罗战场界面.Next=大江山之战界面.to庭院界面
	大江山之战界面.Next=庭院界面.to探索界面
	海国退治界面.Next = 大江山之战界面.to庭院界面
	离岛界面.Next=庭院界面.to探索界面
	道场（居酒屋）界面.Next=离岛界面.to庭院界面
	浮世澡堂界面.Next=离岛界面.to庭院界面
end

function 执行任务.设置交叉超鬼王流程()
	执行任务.重新识别=执行任务.超鬼王
	探索界面.Next=超鬼王界面.to战斗准备界面
	超鬼王界面.Next=战斗准备界面.to战斗界面
	战斗准备界面.Next=战斗界面.to战斗胜利界面
	战斗界面.Next=战斗胜利界面.to超鬼王界面
	战斗胜利界面.Next=超鬼王界面.to战斗准备界面		
	战斗失败界面.Next=超鬼王界面.to战斗准备界面
	庭院界面.Next=超鬼王界面.to战斗准备界面
end

function 执行任务.设置登录游戏流程()
	执行任务.重新识别=执行任务.等待重连
	公告界面.Next=登录界面1.to登录界面2
	登录界面1.Next=登录界面2.to庭院界面
	--登录界面2.Next=登录界面3.to庭院界面
	登录动画界面.Next=公告界面.to登录界面1
end

function 执行任务.设置结束主任务流程()
	执行任务.重新识别=执行任务.结束主任务
	探索关卡界面.Next=探索关卡界面.to探索关卡退出界面
	探索关卡退出界面.Next=探索准备界面.to探索界面
	探索准备界面.Next=探索界面.结束主任务
	大蛇界面.Next=探索界面.结束主任务
	麒麟界面.Next=探索界面.结束主任务
	if 参数.任务=='大蛇' then
		创建队伍界面.Next=组队界面.to大蛇界面
		组队界面.Next=大蛇界面.to探索界面
	elseif 参数.任务=='觉醒' then
		创建队伍界面.Next=组队界面.to麒麟界面
		组队界面.Next=麒麟界面.to探索界面
	elseif 参数.任务=="卑弥呼" then
		创建队伍界面.Next=组队界面.to卑弥呼界面
		组队界面.Next=卑弥呼界面.to探索界面
	else
		组队界面.Next=庭院界面.to探索界面
	end
	房间界面.Next=创建队伍界面.to组队界面
	探索准备界面.Next=探索界面.结束主任务
	参数.任务=''
end
----


-----------协程---------------
function 执行任务.CheckWindowStatus()

end

----


-----------启动任务-----------
function 执行任务.启动任务()
	if 参数.交叉离岛 then
		参数.当前副任务='离岛之歌'
		if 参数.提示信息 then
			syslog2('开始副任务：离岛之歌')
		end
		执行任务.设置交叉离岛流程()
		if 参数.智能开关buff then
			参数.调整开关buff='关'
		end
		mSleep(2000)
		return 执行任务.离岛之歌()
	end

	if 参数.交叉年兽 then
		参数.当前副任务='年兽'
		if 参数.提示信息 then
			syslog2('开始副任务：年兽')
		end
		执行任务.设置交叉年兽流程()
		if 参数.智能开关buff then
			参数.调整开关buff='关'
		end
		mSleep(2000)
		return 执行任务.年兽()
	end
	
	if 参数.交叉死神 and 参数.死神挤车 then
		参数.当前副任务='死神'
		if 参数.提示信息 then
			syslog2('开始副任务：死神')
		end
		执行任务.设置交叉死神流程()
		if 参数.智能开关buff then
			参数.调整开关buff='关'
		end
		mSleep(2000)
		return 执行任务.死神()
	end
	
	if 参数.交叉寮突破 then
		参数.当前副任务='寮突破'
		if 参数.提示信息 then
			syslog2('开始副任务：寮突破')
		end
		执行任务.设置交叉寮突破流程()
		if 参数.智能开关buff then
			参数.调整开关buff='关'
		end
		mSleep(2000)
		return 执行任务.寮突破()
	end
	
	if 参数.交叉个人突破 then
		参数.当前副任务='个人突破'
		if 参数.提示信息 then
			syslog2('开始副任务：个人突破')
		end
		执行任务.设置交叉个人突破流程()
		if 参数.智能开关buff then
			参数.调整开关buff='关'
		end
		mSleep(2000)
		return 执行任务.个人突破()
	end
	
	if 参数.任务=='大蛇' then 
		syslog2(string.format('开始任务：大蛇-%s',参数.组队方式))
		mSleep(2000)
		if 参数.组队方式~='队员' then
			return 执行任务.大蛇()
		elseif 参数.组队方式=='队员' then
			return 执行任务.大蛇队员()
		end
		
	elseif 参数.任务=='卑弥呼' then 
		syslog2(string.format('开始任务：卑弥呼-%s',参数.组队方式))
		mSleep(2000)
		if 参数.组队方式~='队员' then
			return 执行任务.卑弥呼()
		elseif 参数.组队方式=='队员' then
			return 执行任务.卑弥呼队员()
		end
		
	elseif 参数.任务=='觉醒' then 
		syslog2(string.format('开始任务：觉醒-%s',参数.组队方式))		
		mSleep(2000)
		if 参数.组队方式~='队员' then
			return 执行任务.觉醒()
		elseif 参数.组队方式=='队员' then
			return 执行任务.觉醒队员()
		end
		
	elseif 参数.任务=='探索' then
		syslog2(string.format('开始任务：探索-%s',参数.探索组队类型))	
		mSleep(2000)
		if 参数.探索组队类型=='单人' or 参数.探索组队类型=='队长' then
			return 执行任务.探索()
		elseif 参数.探索组队类型=='队员' then
			return 执行任务.探索队员()
		end
		
	elseif 参数.任务=='突破' then
		syslog2(string.format('开始任务：突破-%s',参数.突破方式))
		mSleep(2000)
		if 参数.突破方式=='个人突破' then
			return 执行任务.个人突破()
		elseif 参数.突破方式=='寮突破' then
			return 执行任务.寮突破()
		end
		
	elseif 参数.任务=='业原火' then
		syslog2('开始任务：业原火')
		mSleep(2000)
		return 执行任务.业原火()
		
	elseif 参数.任务=='御灵' then
		syslog2('开始任务：御灵')
		mSleep(2000)
		return 执行任务.御灵()	
		
	elseif 参数.任务=='妖气' then
		syslog2('开始任务：妖气封印')
		mSleep(2000)
		return 执行任务.妖气()
		
	elseif 参数.任务=='死神' then
		syslog2('开始任务：死神')
		mSleep(2000)
		return 执行任务.死神()
		
	elseif 参数.任务=='超鬼王' then
		syslog2('开始任务：超鬼王')
		mSleep(2000)
		return 执行任务.超鬼王（主）()
		
	elseif 参数.任务 == '修罗战场' then
		syslog2('开始任务：修罗战场')
		mSleep(2000)
		return 执行任务.修罗战场()
	
	elseif 参数.任务 == '海国退治' then
		syslog2('开始任务：海国退治')
		mSleep(2000)
		return 执行任务.海国退治()
	
	elseif 参数.任务 == '离岛之歌' then
		syslog2('开始任务：离岛之歌')
		mSleep(2000)
		return 执行任务.离岛之歌()
	
	elseif 参数.任务 == '轮回秘境' then
		syslog2('开始任务：轮回秘境')
		mSleep(2000)
		return 执行任务.轮回秘境()
		
	elseif 参数.任务 == '狗粮升星' then
		syslog2('开始任务：狗粮升星')
		mSleep(2000)
		return 执行任务.狗粮升星()
	
	elseif 参数.任务 == '抽厕纸' then
		syslog2('开始任务：抽厕纸')
		mSleep(2000)
		return 执行任务.抽厕纸()
	end
	
end
----


-----------任务切换-----------
function 执行任务.检查副任务()
	if 参数.交叉超鬼王 then
		mSleep(参数.超鬼王识别前等待)
		执行任务.识别超鬼王()
	end
	
	if 参数.交叉离岛 and 参数.主任务 and mTime()>=参数.离岛CD冷却时刻 then
		return 执行任务.切换离岛()
	end
	
	if 参数.交叉死神 and 参数.主任务 and (mTime()-参数.死神开始计时时刻)>1800000 then
		return 执行任务.切换死神()
	end
	
	if 参数.交叉年兽 and 参数.主任务 and (mTime()-参数.年兽开始计时时刻)>43200000 then
		return 执行任务.切换年兽()
	end
	
	if 参数.交叉寮突破 and not(参数.寮突已攻破) and 参数.主任务 and (mTime()-参数.寮突破开始计时时刻)>参数.寮突破间隔 then
		return 执行任务.切换寮突破()
	end
	
	if 参数.交叉个人突破 and 参数.主任务 and 参数.个人突破穿插依据=='CD冷却后切换' and (mTime()-参数.个人突破开始计时时刻)>参数.个人突破间隔 then
		return 执行任务.切换个人突破()
	end
end

function 执行任务.切换离岛()
	参数.主任务=false
	参数.当前副任务='离岛之歌'
	执行任务.设置交叉离岛流程()
	if 参数.智能开关buff then
		参数.调整开关buff='关'
	end
	if 参数.提示信息 then
		syslog2('切换副任务-离岛之歌')
	end
	return 执行任务.离岛之歌()
end

function 执行任务.切换寮突破()
	参数.主任务=false
	参数.当前副任务='寮突破'
	参数.检查寮=false
	执行任务.设置交叉寮突破流程()
	if 参数.智能开关buff then
		参数.调整开关buff='关'
	end
	if 参数.提示信息 then
		syslog2('切换副任务-寮突破')
	end
	return 执行任务.寮突破()
end

function 执行任务.切换个人突破()
	参数.主任务=false
	参数.当前副任务='个人突破'
	执行任务.设置交叉个人突破流程()
	if 参数.智能开关buff then
		参数.调整开关buff='关'
	end
	if 参数.提示信息 then
		syslog2('切换副任务-个人突破')
	end
	return 执行任务.个人突破()
end

function 执行任务.切换死神()
	参数.主任务=false
	参数.当前副任务='死神'
	执行任务.设置交叉死神流程()
	if 参数.智能开关buff then
		参数.调整开关buff='关'
	end
	--操作.识别点击(按钮.真蛇消息关闭按钮,true)
	操作.识别点击(按钮.拒绝邀请按钮,true)
	if 参数.提示信息 then
		syslog2('切换副任务-死神')
	end
	return 执行任务.死神()
end

function 执行任务.切换年兽()
	参数.主任务=false
	参数.当前副任务='年兽'
	执行任务.设置交叉年兽流程()
	if 参数.智能开关buff then
		参数.调整开关buff='关'
	end
	--操作.识别点击(按钮.真蛇消息关闭按钮,true)
	操作.识别点击(按钮.拒绝邀请按钮,true)
	if 参数.提示信息 then
		syslog2('切换副任务-年兽')
	end
	return 执行任务.年兽()
end

function 执行任务.结束主任务后操作()
	if 参数.交叉寮突破 then
		for i=1,3 do
			if 参数.队友未响应 then
				sysLog('队友未响应')
			else
				sysLog('体力耗尽！')
			end
			mSleep(1000)
			sysLog('即将切换寮突破为主任务')
			mSleep(1000)
		end
		执行任务.切换寮突破为主任务()
	else
		for var = 1,2 do
			vibrator()
			if 参数.队友未响应 then
				syslog2('队友未响应，即将退出！')
			else
				syslog2("体力耗尽，即将退出！");
			end
			mSleep(1000)
		end
		lua_exit()
	end
end

function 执行任务.切换寮突破为主任务()
	参数.任务='突破'
	参数.突破方式='寮突破'
	参数.交叉寮突破=false
	参数.检查寮=false
	参数.寮突破CD重新计时=false
	参数.主任务=true
	执行任务.设置流程()
	return 执行任务.寮突破()
end

function 执行任务.切换死神为主任务()
	参数.任务='死神'
	参数.交叉死神=false
	参数.主任务=true
	参数.死神CD重新计时=false
	执行任务.设置流程()
	return 执行任务.死神()
end

function 执行任务.切换超鬼王为主任务()
	参数.任务='超鬼王'
	参数.主任务=true
	执行任务.设置流程()
	return 执行任务.超鬼王（主）()
end

function 执行任务.切换超鬼王()
	参数.主任务=false
	参数.当前副任务='超鬼王'
	参数.超鬼王中=true
	执行任务.设置交叉超鬼王流程()
	if 参数.智能开关buff then
		参数.调整开关buff='关'
	end
	--操作.识别点击(按钮.真蛇消息关闭按钮,true)
	if not(参数.任务=='超鬼王') then	
		sysLog('切换超鬼王')
	end
	return 执行任务.超鬼王()
end

function 执行任务.识别超鬼王()
--	local 目标星级_自己发现={}
--	table.insert(目标星级_自己发现,按钮.发现一星超鬼王)
--	table.insert(目标星级_自己发现,按钮.发现二星超鬼王)
--	table.insert(目标星级_自己发现,按钮.发现三星超鬼王)
--	table.insert(目标星级_自己发现,按钮.发现四星超鬼王)
--	table.insert(目标星级_自己发现,按钮.发现五星超鬼王)
--	table.insert(目标星级_自己发现,按钮.发现六星超鬼王)
	local 目标星级_好友邀请={}
	local 非目标星级_好友邀请={}
	if (1>=参数.好友邀请的超鬼王最低打几星 and 1<=参数.好友邀请的超鬼王最高打几星) then 
		table.insert(目标星级_好友邀请,按钮.发现一星超鬼王) 
		table.insert(目标星级_好友邀请,按钮.发现一星妖灵超鬼王) 
		
	else 
		table.insert(非目标星级_好友邀请,按钮.发现一星超鬼王) 
		table.insert(目标星级_好友邀请,按钮.发现一星妖灵超鬼王) 
	end
	if (2>=参数.好友邀请的超鬼王最低打几星 and 2<=参数.好友邀请的超鬼王最高打几星) then 
		table.insert(目标星级_好友邀请,按钮.发现二星超鬼王) 
		table.insert(目标星级_好友邀请,按钮.发现二星妖灵超鬼王) 
	else 
		table.insert(非目标星级_好友邀请,按钮.发现二星超鬼王) 
		table.insert(非目标星级_好友邀请,按钮.发现二星妖灵超鬼王) 
	end
	if (3>=参数.好友邀请的超鬼王最低打几星 and 3<=参数.好友邀请的超鬼王最高打几星) then 
		table.insert(目标星级_好友邀请,按钮.发现三星超鬼王) 
		table.insert(目标星级_好友邀请,按钮.发现三星妖灵超鬼王) 
	else 
		table.insert(非目标星级_好友邀请,按钮.发现三星超鬼王) 
		table.insert(非目标星级_好友邀请,按钮.发现三星妖灵超鬼王) 
	end
	if (4>=参数.好友邀请的超鬼王最低打几星 and 4<=参数.好友邀请的超鬼王最高打几星) then 
		table.insert(目标星级_好友邀请,按钮.发现四星超鬼王) 
		table.insert(非目标星级_好友邀请,按钮.发现三星妖灵超鬼王) 
	else 
		table.insert(非目标星级_好友邀请,按钮.发现四星超鬼王) 
		table.insert(非目标星级_好友邀请,按钮.发现四星妖灵超鬼王) 
	end
	if (5>=参数.好友邀请的超鬼王最低打几星 and 5<=参数.好友邀请的超鬼王最高打几星) then 
		table.insert(目标星级_好友邀请,按钮.发现五星超鬼王) 
		table.insert(目标星级_好友邀请,按钮.发现五星妖灵超鬼王) 
	else 
		table.insert(非目标星级_好友邀请,按钮.发现五星超鬼王) 
		table.insert(非目标星级_好友邀请,按钮.发现五星妖灵超鬼王) 
	end
	if (6>=参数.好友邀请的超鬼王最低打几星 and 6<=参数.好友邀请的超鬼王最高打几星) then 
		table.insert(目标星级_好友邀请,按钮.发现六星超鬼王) 
		table.insert(目标星级_好友邀请,按钮.发现六星妖灵超鬼王) 
	else 
		table.insert(非目标星级_好友邀请,按钮.发现六星超鬼王) 
		table.insert(非目标星级_好友邀请,按钮.发现六星妖灵超鬼王) 
	end
	
	keepScreen(true)
	if 操作.识别点击(标识.自己发现超鬼王,true,0,0,202,13,false) then  
		keepScreen(false)
		sysLog('发现超鬼王！')
		mSleep(1500)
		return 执行任务.切换超鬼王()
	end
	keepScreen(false)
	
	if not(参数.超鬼王只打自己发现的) then
		keepScreen(true)
		if not(操作.识别2(标识.发现超鬼王)) then  
			keepScreen(false)
			return 
		end
		sysLog('收到超鬼王邀请！')
		if 操作.或识别点击(目标星级_好友邀请,true,0,0,-109,-17,false) then
			keepScreen(false)
			mSleep(1500)
			return 执行任务.切换超鬼王()
		end
		if not(操作.或识别(非目标星级_好友邀请,false)) then
			keepScreen(false)
			toast('无法识别受邀超鬼王星级，将前往查看！')
			操作.识别点击(标识.发现超鬼王,false,0,0,202,13,false)
			mSleep(1500)
			return 执行任务.切换超鬼王()
		end
		sysLog('该超鬼王不是目标星级！')
		keepScreen(false)
	end
end
----


-----------等待邀请-----------
function 执行任务.等待邀请.等待()
	sysLog('等待邀请中......')
	if 参数.交叉超鬼王 then
		if 操作.识别2(标识.探索界面) then
			mSleep(参数.超鬼王识别前等待)
			执行任务.识别超鬼王()
		end
	end
	if 参数.任务=='探索' and not(参数.已检查探索宝箱) then
		if 操作.识别2(标识.探索界面_探索发现) then
			while true do
				keepScreen(true)
				local 无遮挡=true
--				if 操作.识别点击(按钮.真蛇消息关闭按钮,true) then
--					无遮挡=false
--				end
				if 参数.探索优先接受邀请 then
					if 操作.或识别点击({按钮.接受邀请按钮,按钮.接受邀请按钮2},true,0,0,0,0,false) then 
						sysLog('接受邀请')
						参数.开始等待队友时刻=-1
						参数.已检查探索宝箱=false
						mSleep(1500)
						return 执行任务.等待邀请.Next()
					end
				elseif 操作.识别点击(按钮.拒绝邀请按钮,true) then
					无遮挡=false
				end
				if 无遮挡 then
					break
				end
				keepScreen(false)
				mSleep(1500)
			end
			return 执行任务.重新识别()
		end
	end
	
	if not(参数.默认接受邀请) or 参数.狗粮未换 then
		for i=1,2 do
			if 操作.或识别点击({按钮.接受邀请按钮,按钮.接受邀请按钮2},true,0,0,0,0,false) then 	
				sysLog('接受邀请')
				参数.开始等待队友时刻=-1
				参数.已检查探索宝箱=false
				mSleep(1500)
				return 执行任务.等待邀请.Next()
			end
			mSleep(500)
		end
	else
		for i=1,2 do
			if 操作.或识别点击({按钮.默认接受邀请按钮,按钮.接受邀请按钮,按钮.接受邀请按钮2},true,5,5) then
				sysLog('接受邀请')
				参数.开始等待队友时刻=-1
				参数.已检查探索宝箱=false
				mSleep(1500)
				return 执行任务.等待邀请.Next()
			end
		end
	end
	if 参数.开始等待队友时刻<0 then
		参数.开始等待队友时刻=mTime()
	end
	if 参数.队友未响应结束主任务 then
		if mTime()-参数.开始等待队友时刻>180000 then
			参数.队友未响应=true
			执行任务.设置结束主任务流程()
			return 执行任务.结束主任务()
		end
	end
	return 执行任务.重新识别()
end
----

-----------等待重连-----------
function 执行任务.等待重连()
	while true do
		if not(操作.识别2(标识.重连)) then
			mSleep(1000)
			break
		end
		sysLog('等待重连...')
		参数.开始等待队友时刻=-1
		mSleep(3000)
	end
	
	keepScreen(true)
	if 操作.识别2(标识.战斗结束重连) then
		keepScreen(false)
		sysLog('网络恢复！')
		操作.点击按钮(按钮.战斗结束重连确定按钮)
		mSleep(888)
		return 执行任务.重新识别()
	end
	
	if 操作.识别2(标识.断线重连) then
		keepScreen(false)
		sysLog('重新登录')
		操作.点击按钮(按钮.断线重连确定按钮)
		mSleep(2000)
		执行任务.设置登录游戏流程()
		return 执行任务.登录游戏()
	end
	
	if 操作.或识别({标识.公告界面,标识.登录界面1},false) then
		keepScreen(false)
		执行任务.设置登录游戏流程()
		return 执行任务.登录游戏()
	end
	
	if 操作.识别2(标识.登录动画界面) then
		keepScreen(false)
		mSleep(3000)
		if 操作.识别2(标识.登录动画界面) then
			执行任务.设置登录游戏流程()
			return 执行任务.登录游戏()
		end
	end
	
	if 操作.或识别({标识.庭院界面1,标识.庭院界面2},false) then
		keepScreen(false)
		执行任务.设置流程()
		return 执行任务.主任务()
	end
	
	keepScreen(false)
	执行任务.检查闪退()
	return 执行任务.重新识别()
end
----

-----------登录游戏-----------
function 执行任务.登录游戏()
	for i=1,5 do
		sysLog('进入登录流程')
		keepScreen(true)
		
		if 操作.识别2(标识.公告界面) then
			keepScreen(false)
			return 公告界面.to登录界面1()
		end
		
		if 操作.识别2(标识.登录界面1) then
			keepScreen(false)
			return 登录界面1.to登录界面2()
		end
		
		if 操作.识别2(标识.登录界面2) then
			keepScreen(false)
			return 登录界面2.to庭院界面()
		end
		
--		if 操作.识别2(标识.登录界面3) then
--			keepScreen(false)
--			return 登录界面3.to庭院界面()
--		end
		
		if 操作.识别2(标识.登录动画界面) then
			keepScreen(false)
			return 登录动画界面.to公告界面()
		end
		
		if 操作.或识别({标识.庭院界面1,标识.庭院界面2},false) then
			keepScreen(false)
			执行任务.设置流程()
			return 执行任务.主任务()
		end
		keepScreen(false)
		执行任务.检查闪退()
		mSleep(1000)
	end
	执行任务.设置流程()
	return 执行任务.主任务()
end
----

----------结束主任务----------
function 执行任务.结束主任务()
	while true do
		sysLog('重新识别界面中')
		keepScreen(true)
		
		if 操作.或识别({标识.庭院界面1,标识.庭院界面2},false) then
			keepScreen(false)
			return 庭院界面.结束主任务()
		end
		
		if 操作.识别2(标识.探索关卡界面) then 
			keepScreen(false)
			return 探索关卡界面.to探索关卡退出界面()
		end
		
		if 操作.识别2(标识.探索关卡退出界面) then 
			keepScreen(false)
			return 探索关卡退出界面.退出()
		end
		
		if 操作.识别2(标识.探索界面) then
			keepScreen(false)
			return 探索界面.结束主任务()
		end
		
		if 操作.识别2(标识.创建队伍界面) then
			keepScreen(false)
			return 创建队伍界面.to组队界面()
		end
		 
		if 操作.识别2(标识.组队界面) then
			keepScreen(false)
			if 参数.任务=='大蛇' then
				return 组队界面.to大蛇界面()
			elseif 参数.任务=='觉醒' then
				return 组队界面.to麒麟界面()
			else
				return 组队界面.to庭院界面()
			end
		end
		
		if 操作.识别2(标识.大蛇界面) then
			keepScreen(false)
			return 大蛇界面.to探索界面()
		end
		
		if 操作.或识别({标识.麒麟界面1,标识.麒麟界面2},false) then
			keepScreen(false)
			return 麒麟界面.to探索界面()
		end
		
		if 操作.识别2(标识.房间界面) then
			keepScreen(false)
			return 房间界面.退出房间()
		end
		
		if 操作.识别2(标识.探索邀请界面) then
			keepScreen(false)
			return 探索邀请界面.to探索准备界面()
		end
		
		keepScreen(false)
		执行任务.检查闪退()
		mSleep(1000)
	end
end
----

-----------检查闪退-----------
function 执行任务.检查闪退()
	if 参数.检查后台 then
		isfront = isFrontApp(参数.appid)
		if isfront==0 then
			runApp(参数.appid)
			if 参数.提示信息 then
				hideHUD(myhud)
				myhud=createHUD()
			end
			sysLog('禁止后台运行！')
			mSleep(3000)
			--return 执行任务.重新识别()
		end
	end
	
	if 参数.闪退重连 then
		isrunning = appIsRunning(参数.appid)
		if isrunning==0 then
			runApp(参数.appid)
			hideHUD(myhud)
			if 参数.提示信息 then
				myhud=createHUD()
			end
			sysLog('重启游戏！')
			mSleep(3000)
			执行任务.设置登录游戏流程()
			return 执行任务.登录游戏()
		end
	end
end
----


---------------------------具体任务-------------------------------

-----------大蛇队长-----------
function 执行任务.大蛇()
	sysLog('重新识别界面中......')
	while true do
		keepScreen(true)
		
		if 操作.识别2(标识.协作界面) then
			keepScreen(false)
			return 协作任务界面.处理()
		end
		
		if 操作.识别2(标识.超鬼王界面) then
			keepScreen(false)
			if 参数.交叉超鬼王 then
				return 执行任务.切换超鬼王()
			else
				操作.点击按钮(按钮.超鬼王界面_退出按钮)
				mSleep(300)
				return 探索界面.to御魂界面()
			end
		end
		
		if 操作.或识别({标识.庭院界面1,标识.庭院界面2},false) then
			keepScreen(false)
			return 庭院界面.to探索界面()
		end
		
		if 操作.识别2(标识.探索界面) then
			keepScreen(false)
			if 参数.智能开关buff and 参数.调整开关buff~='保持' then
				探索界面.开关buff()
			end
			return 探索界面.to御魂界面()
		end
		
		if 操作.识别2(标识.御魂界面) then
			keepScreen(false)
			return 御魂界面.to大蛇界面()
		end
		
		if 操作.识别2(标识.大蛇界面) then
			keepScreen(false)
			if 参数.组队方式~='单人' then 
				return 大蛇界面.to组队界面()
			else
				return 大蛇界面.to战斗准备界面()
			end
		end	
		
		if 参数.组队方式~='单人' then
			if 操作.识别2(标识.组队界面) then
				keepScreen(false)
				return 组队界面.to创建队伍界面()
			end
			
			if 操作.识别2(标识.创建队伍界面) then
				keepScreen(false)
				return 创建队伍界面.to房间界面()
			end
		end
		
		if 操作.识别2(标识.房间界面) then
			keepScreen(false)
			参数.cnt=8
			return 房间界面.to战斗准备界面()
		end
		
		if 操作.识别2(标识.房间邀请界面) then
			keepScreen(false)
			return 房间邀请界面.to房间界面()
		end
		
		if 操作.识别2(标识.房间退出界面) then
			keepScreen(false)
			return 房间退出界面.to创建队伍界面()
		end
		
		if 操作.识别2(标识.房间界面好友资料) then
			keepScreen(false)
			房间界面好友资料.返回()
		end
		
		if 操作.识别2(标识.战斗准备界面) then
			keepScreen(false)
			return 战斗准备界面.to战斗界面()
		end
		
		if 操作.识别2(标识.寄养界面) then
			keepScreen(false)
			寄养界面.退出()
		end
		
		if 参数.御魂换狗粮 then
			if 操作.识别2(标识.换狗粮界面) then
				keepScreen(false)
				return 换狗粮界面.to战斗准备界面（御魂）()
			end
			
			if 操作.识别2(标识.选稀有度界面) then
				keepScreen(false)
				参数.等待邀请次数=0
				选稀有度界面.选稀有度()
				return 换狗粮界面.to战斗准备界面（御魂）()
			end
		end
		
		if 操作.识别2(标识.战斗界面) then
			keepScreen(false)
			return 战斗界面.to战斗胜利界面()
		end
		
		if 操作.或识别({标识.公告界面,标识.登录界面1},false) then
			keepScreen(false)
			执行任务.设置登录游戏流程()
			return 执行任务.登录游戏()
		end
		
		if 操作.或识别({标识.战斗胜利界面1,标识.战斗胜利界面2, 标识.战斗胜利界面3},false) then
			keepScreen(false)
			return 战斗胜利界面.to战斗结算界面2()
		end
		
		if 操作.识别2(标识.战斗失败界面) then
			keepScreen(false)
			if 参数.组队方式~='单人' then
				return 战斗失败界面.to重邀界面()
			else
				return 战斗失败界面.to大蛇界面()
			end
		end
		
		if 操作.识别2(标识.战斗结算界面1) then
			keepScreen(false)
			return 战斗结算界面1.to战斗结算界面2()
		end
		
		if 操作.识别2(标识.战斗结算界面2) then
			keepScreen(false)
			if 参数.组队方式~='单人' then
				return 战斗结算界面2.to重邀界面()
			else
				return 战斗结算界面2.to大蛇界面()
			end
		end
		
		if 操作.识别2(标识.战斗结算界面2_御魂超出上限) then
			keepScreen(false)
			参数.御魂超出上限=true
			操作.点击按钮(按钮.战斗结算界面2_御魂超出上限确定按钮)
			mSleep(666)
			if 参数.组队方式~='单人' then
				return 战斗结算界面2.to重邀界面()
			else
				return 战斗结算界面2.to大蛇界面()
			end
		end
		
		if 操作.识别2(标识.战斗结算界面3) then
			keepScreen(false)
			if 参数.组队方式~='单人' then
				return 战斗结算界面3.to重邀界面()
			else
				return 战斗结算界面3.to大蛇界面()
			end
		end
		
		if 操作.识别2(标识.重邀界面) then
			keepScreen(false)
			return 重邀界面.to房间界面()
		end
		
		if 操作.识别2(标识.个人突破界面) then
			keepScreen(false)
			操作.点击按钮(按钮.个人突破界面_退出按钮)
			mSleep(888)
			return 探索界面.to御魂界面()
		end
		
		if 操作.识别2(标识.寮突破界面) then
			keepScreen(false)
			操作.点击按钮(按钮.寮突破界面_退出按钮)
			mSleep(888)
			return 探索界面.to御魂界面()
		end
		
		if 操作.识别2(标识.真蛇界面) then
			keepScreen(false)
			return 真蛇界面.to探索界面()
		end
		
		if 操作.识别2(标识.购买体力界面) then
			keepScreen(false)
			return 购买体力界面.操作()
		end
		
		if 操作.识别2(标识.探索准备界面) then
			keepScreen(false)
			return 探索准备界面.to探索界面()
		end
		
		if 操作.识别2(标识.邮箱界面) then
			keepScreen(false)
			操作.点击按钮(按钮.邮箱界面_关闭)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.寮公告界面) then
			keepScreen(false)
			操作.点击按钮(按钮.寮公告界面_确定)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.召唤界面) then
			keepScreen(false)
			操作.点击按钮(按钮.召唤界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.结界界面) then
			keepScreen(false)
			操作.点击按钮(按钮.结界界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end	
		
		if 操作.识别2(标识.buff界面) then
			keepScreen(false)
			操作.点击按钮(按钮.buff界面_退出区域)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.重连) then
			keepScreen(false)
			执行任务.等待重连()
		end
		
		if 操作.识别2(标识.登录动画界面) then
			keepScreen(false)
			mSleep(3000)
			if 操作.识别2(标识.登录动画界面) then
				执行任务.设置登录游戏流程()
				return 执行任务.登录游戏()
			end
		end
		
		if 参数.禁止聊天 then
			if 操作.识别点击(按钮.频道界面_关闭按钮,true) then
				keepScreen(false)
				mSleep(888)
				return 执行任务.重新识别()
			end
		
			if 操作.识别2(标识.聊天界面) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭按钮)
				mSleep(888)
				return 执行任务.重新识别()
			end
			
			if 操作.识别2(标识.聊天界面_好友信息) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭好友信息)
				mSleep(888)
				return 执行任务.重新识别()
			end
		end
		
		if 操作.识别点击(按钮.式神录界面_返回按钮,true) then
			keepScreen(false)
			mSleep(2000)
			return 执行任务.重新识别()
		end
		
		if 操作.或识别({标识.离岛界面,标识.离岛界面2},false) then
			keepScreen(false)
			操作.点击按钮(按钮.离岛界面_返回)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.道场（居酒屋）界面) then
			keepScreen(false)
			操作.点击按钮(按钮.道场（居酒屋）界面_关闭)
			mSleep(666)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.浮世澡堂界面) then
			keepScreen(false)
			操作.点击按钮(按钮.浮世澡堂界面_关闭)
			mSleep(666)
			return 执行任务.重新识别()
		end
		
		keepScreen(false)
		执行任务.检查闪退()
		mSleep(1000)
	end
	
	
end
----

-----------大蛇队员-----------
function 执行任务.大蛇队员()
	sysLog('重新识别界面中......')
	for i=1,2 do
		keepScreen(true)
		
		if 操作.识别2(标识.协作界面) then
			keepScreen(false)
			return 协作任务界面.处理()
		end
		
		if 操作.识别2(标识.超鬼王界面) then
			keepScreen(false)
			if 参数.交叉超鬼王 then
				return 执行任务.切换超鬼王()
			else
				操作.点击按钮(按钮.超鬼王界面_退出按钮)
				mSleep(300)
				return 探索界面.to御魂界面()
			end
		end
		
		if 操作.或识别({标识.庭院界面1,标识.庭院界面2},false) then
			if 参数.智能开关buff and 参数.调整开关buff=='关' then
				keepScreen(false)
				庭院界面.开关buff()
			end
			
			if 参数.交叉离岛 or 参数.交叉寮突破 or 参数.交叉个人突破 or 参数.交叉超鬼王 or 参数.交叉死神 then
				keepScreen(false)
				庭院界面.切换副任务()
			end
		end
		
		if 操作.识别2(标识.探索界面) then
			if 参数.智能开关buff and 参数.调整开关buff=='关' then
				keepScreen(false)
				探索界面.开关buff()
			end
			
			if 参数.交叉离岛 or 参数.交叉寮突破 or 参数.交叉个人突破 or 参数.交叉超鬼王 or 参数.交叉死神 then
				keepScreen(false)
				探索界面.切换副任务(true)
			end
		end
		
		if 操作.识别2(标识.房间界面) then
			keepScreen(false)
			参数.cnt=8
			参数.等待邀请次数=0
			return 房间界面.to战斗准备界面（队员）()
		end
		
		if 操作.识别2(标识.房间邀请界面) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 房间邀请界面.to房间界面()
		end
		
		if 操作.识别2(标识.房间退出界面) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 房间退出界面.to创建队伍界面()
		end
		
		if 操作.识别2(标识.房间界面好友资料) then
			keepScreen(false)
			操作.点击按钮(按钮.房间界面好友资料_返回按钮)
			参数.cnt=8
			参数.等待邀请次数=0
			sysLog('关闭队友名片')
			mSleep(600)
			return 房间界面.to战斗准备界面（队员）()
		end
		
		if 操作.识别2(标识.战斗准备界面) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 战斗准备界面.to战斗界面()
		end
		
		if 操作.识别2(标识.寄养界面) then
			keepScreen(false)
			寄养界面.退出()
		end
		
		if 参数.御魂换狗粮 then
			if 操作.识别2(标识.换狗粮界面) then
				keepScreen(false)
				参数.等待邀请次数=0
				return 换狗粮界面.to战斗准备界面（御魂）()
			end
			
			if 操作.识别2(标识.选稀有度界面) then
				keepScreen(false)
				参数.等待邀请次数=0
				选稀有度界面.选稀有度()
				return 换狗粮界面.to战斗准备界面（御魂）()
			end
		end
		
		if 操作.识别2(标识.战斗界面) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 战斗界面.to战斗胜利界面()
		end
		
		if 操作.或识别({标识.公告界面,标识.登录界面1},false) then
			keepScreen(false)
			参数.等待邀请次数=0
			执行任务.设置登录游戏流程()
			return 执行任务.登录游戏()
		end
		
		if 操作.或识别({标识.战斗胜利界面1,标识.战斗胜利界面2, 标识.战斗胜利界面3},false) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 战斗胜利界面.to战斗结算界面2()
		end
		
		if 操作.识别2(标识.战斗失败界面) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 战斗失败界面.退出()
		end
		
		if 操作.识别2(标识.战斗结算界面1) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 战斗结算界面1.to战斗结算界面2()
		end
		
		if 操作.识别2(标识.战斗结算界面2) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 战斗结算界面2.领奖()
		end
		
		if 操作.识别2(标识.战斗结算界面2_御魂超出上限) then
			keepScreen(false)
			参数.御魂超出上限=true
			操作.点击按钮(按钮.战斗结算界面2_御魂超出上限确定按钮)
			mSleep(666)
			return 战斗结算界面2.领奖()
		end
		
		if 操作.识别2(标识.战斗结算界面3) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 战斗结算界面3.领奖()
		end
		
		if 操作.识别2(标识.购买体力界面) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 购买体力界面.操作()
		end
		
		if 操作.识别2(标识.邮箱界面) then
			keepScreen(false)
			操作.点击按钮(按钮.邮箱界面_关闭)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.寮公告界面) then
			keepScreen(false)
			操作.点击按钮(按钮.寮公告界面_确定)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.召唤界面) then
			keepScreen(false)
			操作.点击按钮(按钮.召唤界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.结界界面) then
			keepScreen(false)
			操作.点击按钮(按钮.结界界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end	
		
		if 操作.识别2(标识.buff界面) then
			keepScreen(false)
			操作.点击按钮(按钮.buff界面_退出区域)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.重连) then
			keepScreen(false)
			参数.等待邀请次数=0
			执行任务.等待重连()
		end
		
		if 操作.识别2(标识.登录动画界面) then
			keepScreen(false)
			参数.等待邀请次数=0
			mSleep(3000)
			if 操作.识别2(标识.登录动画界面) then
				执行任务.设置登录游戏流程()
				return 执行任务.登录游戏()
			end
		end
		
		if 参数.禁止聊天 then
			if 操作.识别点击(按钮.频道界面_关闭按钮,true) then
				keepScreen(false)
				mSleep(888)
				return 执行任务.重新识别()
			end
		
			if 操作.识别2(标识.聊天界面) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭按钮)
				mSleep(888)
				return 执行任务.重新识别()
			end
			
			if 操作.识别2(标识.聊天界面_好友信息) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭好友信息)
				mSleep(888)
				return 执行任务.重新识别()
			end
		end
		
		if 操作.识别点击(按钮.式神录界面_返回按钮,true) then
			keepScreen(false)
			mSleep(2000)
			return 执行任务.重新识别()
		end
		
		if 操作.或识别({标识.离岛界面,标识.离岛界面2},false) then
			keepScreen(false)
			操作.点击按钮(按钮.离岛界面_返回)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.道场（居酒屋）界面) then
			keepScreen(false)
			操作.点击按钮(按钮.道场（居酒屋）界面_关闭)
			mSleep(666)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.浮世澡堂界面) then
			keepScreen(false)
			操作.点击按钮(按钮.浮世澡堂界面_关闭)
			mSleep(666)
			return 执行任务.重新识别()
		end
		
		keepScreen(false)
		执行任务.检查闪退()
		
		if 参数.队员首次全识别 then
			参数.队员首次全识别=false
			return 执行任务.等待邀请.等待()
		end
		
		mSleep(500)
	end
	
	return 执行任务.等待邀请.等待()
	
end
----

-----------卑弥呼队长-----------
function 执行任务.卑弥呼()
	sysLog('重新识别界面中......')
	while true do
		keepScreen(true)
		
		if 操作.识别2(标识.协作界面) then
			keepScreen(false)
			return 协作任务界面.处理()
		end
		
		if 操作.识别2(标识.超鬼王界面) then
			keepScreen(false)
			if 参数.交叉超鬼王 then
				return 执行任务.切换超鬼王()
			else
				操作.点击按钮(按钮.超鬼王界面_退出按钮)
				mSleep(300)
				return 探索界面.to御魂界面()
			end
		end
		
		if 操作.或识别({标识.庭院界面1,标识.庭院界面2},false) then
			keepScreen(false)
			return 庭院界面.to探索界面()
		end
		
		if 操作.识别2(标识.探索界面) then
			keepScreen(false)
			if 参数.智能开关buff and 参数.调整开关buff~='保持' then
				探索界面.开关buff()
			end
			return 探索界面.to御魂界面()
		end
		
		if 操作.识别2(标识.御魂界面) then
			keepScreen(false)
			return 御魂界面.to大蛇界面()
		end
		
		if 操作.识别2(标识.卑弥呼界面) then
			keepScreen(false)
			if 参数.组队方式~='单人' then 
				return 卑弥呼界面.to组队界面()
			else
				return 卑弥呼界面.to战斗准备界面()
			end
		end	
		
		if 参数.组队方式~='单人' then
			if 操作.识别2(标识.组队界面) then
				keepScreen(false)
				return 组队界面.to创建队伍界面()
			end
			
			if 操作.识别2(标识.创建队伍界面) then
				keepScreen(false)
				return 创建队伍界面.to房间界面()
			end
		end
		
		if 操作.识别2(标识.房间界面) then
			keepScreen(false)
			参数.cnt=8
			return 房间界面.to战斗准备界面()
		end
		
		if 操作.识别2(标识.房间邀请界面) then
			keepScreen(false)
			return 房间邀请界面.to房间界面()
		end
		
		if 操作.识别2(标识.房间退出界面) then
			keepScreen(false)
			return 房间退出界面.to创建队伍界面()
		end
		
		if 操作.识别2(标识.房间界面好友资料) then
			keepScreen(false)
			房间界面好友资料.返回()
		end
		
		if 操作.识别2(标识.战斗准备界面) then
			keepScreen(false)
			return 战斗准备界面.to战斗界面()
		end
		
		if 操作.识别2(标识.寄养界面) then
			keepScreen(false)
			寄养界面.退出()
		end
		
		if 参数.御魂换狗粮 then
			if 操作.识别2(标识.换狗粮界面) then
				keepScreen(false)
				return 换狗粮界面.to战斗准备界面（御魂）()
			end
			
			if 操作.识别2(标识.选稀有度界面) then
				keepScreen(false)
				参数.等待邀请次数=0
				选稀有度界面.选稀有度()
				return 换狗粮界面.to战斗准备界面（御魂）()
			end
		end
		
		if 操作.识别2(标识.战斗界面) then
			keepScreen(false)
			return 战斗界面.to战斗胜利界面()
		end
		
		if 操作.或识别({标识.公告界面,标识.登录界面1},false) then
			keepScreen(false)
			执行任务.设置登录游戏流程()
			return 执行任务.登录游戏()
		end
		
		if 操作.或识别({标识.战斗胜利界面1,标识.战斗胜利界面2,标识.战斗胜利界面3},false) then
			keepScreen(false)
			return 战斗胜利界面.to战斗结算界面2()
		end
		
		if 操作.识别2(标识.战斗失败界面) then
			keepScreen(false)
			if 参数.组队方式~='单人' then
				return 战斗失败界面.to重邀界面()
			else
				return 战斗失败界面.to卑弥呼界面()
			end
		end
		
		if 操作.识别2(标识.战斗结算界面1) then
			keepScreen(false)
			return 战斗结算界面1.to战斗结算界面2()
		end
		
		if 操作.识别2(标识.战斗结算界面2) then
			keepScreen(false)
			if 参数.组队方式~='单人' then
				return 战斗结算界面2.to重邀界面()
			else
				return 战斗结算界面2.to卑弥呼界面()
			end
		end
		
		if 操作.识别2(标识.战斗结算界面2_御魂超出上限) then
			keepScreen(false)
			参数.御魂超出上限=true
			操作.点击按钮(按钮.战斗结算界面2_御魂超出上限确定按钮)
			mSleep(666)
			if 参数.组队方式~='单人' then
				return 战斗结算界面2.to重邀界面()
			else
				return 战斗结算界面2.to卑弥呼界面()
			end
		end
		
		if 操作.识别2(标识.战斗结算界面3) then
			keepScreen(false)
			if 参数.组队方式~='单人' then
				return 战斗结算界面3.to重邀界面()
			else
				return 战斗结算界面3.to卑弥呼界面()
			end
		end
		
		if 操作.识别2(标识.重邀界面) then
			keepScreen(false)
			return 重邀界面.to房间界面()
		end
		
		if 操作.识别2(标识.个人突破界面) then
			keepScreen(false)
			操作.点击按钮(按钮.个人突破界面_退出按钮)
			mSleep(888)
			return 探索界面.to御魂界面()
		end
		
		if 操作.识别2(标识.寮突破界面) then
			keepScreen(false)
			操作.点击按钮(按钮.寮突破界面_退出按钮)
			mSleep(888)
			return 探索界面.to御魂界面()
		end
		
		if 操作.识别2(标识.真蛇界面) then
			keepScreen(false)
			return 真蛇界面.to探索界面()
		end
		
		if 操作.识别2(标识.购买体力界面) then
			keepScreen(false)
			return 购买体力界面.操作()
		end
		
		if 操作.识别2(标识.探索准备界面) then
			keepScreen(false)
			return 探索准备界面.to探索界面()
		end
		
		if 操作.识别2(标识.邮箱界面) then
			keepScreen(false)
			操作.点击按钮(按钮.邮箱界面_关闭)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.寮公告界面) then
			keepScreen(false)
			操作.点击按钮(按钮.寮公告界面_确定)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.召唤界面) then
			keepScreen(false)
			操作.点击按钮(按钮.召唤界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.结界界面) then
			keepScreen(false)
			操作.点击按钮(按钮.结界界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end	
		
		if 操作.识别2(标识.buff界面) then
			keepScreen(false)
			操作.点击按钮(按钮.buff界面_退出区域)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.重连) then
			keepScreen(false)
			执行任务.等待重连()
		end
		
		if 操作.识别2(标识.登录动画界面) then
			keepScreen(false)
			mSleep(3000)
			if 操作.识别2(标识.登录动画界面) then
				执行任务.设置登录游戏流程()
				return 执行任务.登录游戏()
			end
		end
		
		if 参数.禁止聊天 then
			if 操作.识别点击(按钮.频道界面_关闭按钮,true) then
				keepScreen(false)
				mSleep(888)
				return 执行任务.重新识别()
			end
		
			if 操作.识别2(标识.聊天界面) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭按钮)
				mSleep(888)
				return 执行任务.重新识别()
			end
			
			if 操作.识别2(标识.聊天界面_好友信息) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭好友信息)
				mSleep(888)
				return 执行任务.重新识别()
			end
		end
		
		if 操作.识别点击(按钮.式神录界面_返回按钮,true) then
			keepScreen(false)
			mSleep(2000)
			return 执行任务.重新识别()
		end
		
		if 操作.或识别({标识.离岛界面,标识.离岛界面2},false) then
			keepScreen(false)
			操作.点击按钮(按钮.离岛界面_返回)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.道场（居酒屋）界面) then
			keepScreen(false)
			操作.点击按钮(按钮.道场（居酒屋）界面_关闭)
			mSleep(666)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.浮世澡堂界面) then
			keepScreen(false)
			操作.点击按钮(按钮.浮世澡堂界面_关闭)
			mSleep(666)
			return 执行任务.重新识别()
		end
		
		keepScreen(false)
		执行任务.检查闪退()
		mSleep(1000)
	end
	
	
end
----

-----------卑弥呼队员-----------
function 执行任务.卑弥呼队员()
	sysLog('重新识别界面中......')
	for i=1,2 do
		keepScreen(true)
		
		if 操作.识别2(标识.协作界面) then
			keepScreen(false)
			return 协作任务界面.处理()
		end
		
		if 操作.识别2(标识.超鬼王界面) then
			keepScreen(false)
			if 参数.交叉超鬼王 then
				return 执行任务.切换超鬼王()
			else
				操作.点击按钮(按钮.超鬼王界面_退出按钮)
				mSleep(300)
				return 探索界面.to御魂界面()
			end
		end
		
		if 操作.或识别({标识.庭院界面1,标识.庭院界面2},false) then
			if 参数.智能开关buff and 参数.调整开关buff=='关' then
				keepScreen(false)
				庭院界面.开关buff()
			end
			
			if 参数.交叉离岛 or 参数.交叉寮突破 or 参数.交叉个人突破 or 参数.交叉超鬼王 or 参数.交叉死神 then
				keepScreen(false)
				庭院界面.切换副任务()
			end
		end
		
		if 操作.识别2(标识.探索界面) then
			if 参数.智能开关buff and 参数.调整开关buff=='关' then
				keepScreen(false)
				探索界面.开关buff()
			end
			
			if 参数.交叉离岛 or 参数.交叉寮突破 or 参数.交叉个人突破 or 参数.交叉超鬼王 or 参数.交叉死神 then
				keepScreen(false)
				探索界面.切换副任务(true)
			end
		end
		
		if 操作.识别2(标识.房间界面) then
			keepScreen(false)
			参数.cnt=8
			参数.等待邀请次数=0
			return 房间界面.to战斗准备界面（队员）()
		end
		
		if 操作.识别2(标识.房间邀请界面) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 房间邀请界面.to房间界面()
		end
		
		if 操作.识别2(标识.房间退出界面) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 房间退出界面.to创建队伍界面()
		end
		
		if 操作.识别2(标识.房间界面好友资料) then
			keepScreen(false)
			操作.点击按钮(按钮.房间界面好友资料_返回按钮)
			参数.cnt=8
			参数.等待邀请次数=0
			sysLog('关闭队友名片')
			mSleep(600)
			return 房间界面.to战斗准备界面（队员）()
		end
		
		if 操作.识别2(标识.战斗准备界面) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 战斗准备界面.to战斗界面()
		end
		
		if 操作.识别2(标识.寄养界面) then
			keepScreen(false)
			寄养界面.退出()
		end
		
		if 参数.御魂换狗粮 then
			if 操作.识别2(标识.换狗粮界面) then
				keepScreen(false)
				参数.等待邀请次数=0
				return 换狗粮界面.to战斗准备界面（御魂）()
			end
			
			if 操作.识别2(标识.选稀有度界面) then
				keepScreen(false)
				参数.等待邀请次数=0
				选稀有度界面.选稀有度()
				return 换狗粮界面.to战斗准备界面（御魂）()
			end
		end
		
		if 操作.识别2(标识.战斗界面) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 战斗界面.to战斗胜利界面()
		end
		
		if 操作.或识别({标识.公告界面,标识.登录界面1},false) then
			keepScreen(false)
			参数.等待邀请次数=0
			执行任务.设置登录游戏流程()
			return 执行任务.登录游戏()
		end
		
		if 操作.或识别({标识.战斗胜利界面1,标识.战斗胜利界面2,标识.战斗胜利界面3},false) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 战斗胜利界面.to战斗结算界面2()
		end
		
		if 操作.识别2(标识.战斗失败界面) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 战斗失败界面.退出()
		end
		
		if 操作.识别2(标识.战斗结算界面1) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 战斗结算界面1.to战斗结算界面2()
		end
		
		if 操作.识别2(标识.战斗结算界面2) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 战斗结算界面2.领奖()
		end
		
		if 操作.识别2(标识.战斗结算界面2_御魂超出上限) then
			keepScreen(false)
			参数.御魂超出上限=true
			操作.点击按钮(按钮.战斗结算界面2_御魂超出上限确定按钮)
			mSleep(666)
			return 战斗结算界面2.领奖()
		end
		
		if 操作.识别2(标识.战斗结算界面3) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 战斗结算界面3.领奖()
		end
		
		if 操作.识别2(标识.购买体力界面) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 购买体力界面.操作()
		end
		
		if 操作.识别2(标识.邮箱界面) then
			keepScreen(false)
			操作.点击按钮(按钮.邮箱界面_关闭)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.寮公告界面) then
			keepScreen(false)
			操作.点击按钮(按钮.寮公告界面_确定)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.召唤界面) then
			keepScreen(false)
			操作.点击按钮(按钮.召唤界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.结界界面) then
			keepScreen(false)
			操作.点击按钮(按钮.结界界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end	
		
		if 操作.识别2(标识.buff界面) then
			keepScreen(false)
			操作.点击按钮(按钮.buff界面_退出区域)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.重连) then
			keepScreen(false)
			参数.等待邀请次数=0
			执行任务.等待重连()
		end
		
		if 操作.识别2(标识.登录动画界面) then
			keepScreen(false)
			参数.等待邀请次数=0
			mSleep(3000)
			if 操作.识别2(标识.登录动画界面) then
				执行任务.设置登录游戏流程()
				return 执行任务.登录游戏()
			end
		end
		
		if 参数.禁止聊天 then
			if 操作.识别点击(按钮.频道界面_关闭按钮,true) then
				keepScreen(false)
				mSleep(888)
				return 执行任务.重新识别()
			end
		
			if 操作.识别2(标识.聊天界面) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭按钮)
				mSleep(888)
				return 执行任务.重新识别()
			end
			
			if 操作.识别2(标识.聊天界面_好友信息) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭好友信息)
				mSleep(888)
				return 执行任务.重新识别()
			end
		end
		
		if 操作.识别点击(按钮.式神录界面_返回按钮,true) then
			keepScreen(false)
			mSleep(2000)
			return 执行任务.重新识别()
		end
		
		if 操作.或识别({标识.离岛界面,标识.离岛界面2},false) then
			keepScreen(false)
			操作.点击按钮(按钮.离岛界面_返回)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.道场（居酒屋）界面) then
			keepScreen(false)
			操作.点击按钮(按钮.道场（居酒屋）界面_关闭)
			mSleep(666)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.浮世澡堂界面) then
			keepScreen(false)
			操作.点击按钮(按钮.浮世澡堂界面_关闭)
			mSleep(666)
			return 执行任务.重新识别()
		end
		
		keepScreen(false)
		执行任务.检查闪退()
		
		if 参数.队员首次全识别 then
			参数.队员首次全识别=false
			return 执行任务.等待邀请.等待()
		end
		
		mSleep(500)
	end
	
	return 执行任务.等待邀请.等待()
	
end
----

-----------觉醒队长-----------
function 执行任务.觉醒()
	sysLog('重新识别界面中......')
	while true do
		keepScreen(true)
		
		if 操作.识别2(标识.协作界面) then
			keepScreen(false)
			return 协作任务界面.处理()
		end
		
		if 操作.识别2(标识.超鬼王界面) then
			keepScreen(false)
			if 参数.交叉超鬼王 then
				return 执行任务.切换超鬼王()
			else
				操作.点击按钮(按钮.超鬼王界面_退出按钮)
				mSleep(300)
				return 探索界面.to觉醒界面()
			end
		end
		
		if 操作.或识别({标识.庭院界面1,标识.庭院界面2},false) then
			keepScreen(false)
			return 庭院界面.to探索界面()
		end
		
		if 操作.识别2(标识.探索界面) then
			keepScreen(false)
			if 参数.智能开关buff and 参数.调整开关buff~='保持' then
				探索界面.开关buff()
			end
			return 探索界面.to觉醒界面()
		end
		
		if 操作.识别2(标识.觉醒界面) then
			keepScreen(false)
			return 觉醒界面.to麒麟界面()
		end
		
		if 操作.或识别({标识.麒麟界面1,标识.麒麟界面2},false) then
			keepScreen(false)
			if 参数.组队方式~='单人' then 
				return 麒麟界面.to组队界面()
			else
				return 麒麟界面.to战斗准备界面()
			end
		end
		
		if 参数.组队方式~='单人' then
			if 操作.识别2(标识.组队界面) then
				keepScreen(false)
				return 组队界面.to创建队伍界面()
			end
			
			if 操作.识别2(标识.创建队伍界面) then
				keepScreen(false)
				return 创建队伍界面.to房间界面()
			end
		end
		
		if 操作.识别2(标识.房间界面) then
			keepScreen(false)
			参数.cnt=8
			return 房间界面.to战斗准备界面()
		end
		
		if 操作.识别2(标识.房间邀请界面) then
			keepScreen(false)
			return 房间邀请界面.to房间界面()
		end
		
		if 操作.识别2(标识.房间退出界面) then
			keepScreen(false)
			return 房间退出界面.to创建队伍界面()
		end
		
		if 操作.识别2(标识.房间界面好友资料) then
			keepScreen(false)
			房间界面好友资料.返回()
		end
		
		if 操作.识别2(标识.战斗准备界面) then
			keepScreen(false)
			return 战斗准备界面.to战斗界面()
		end
		
		if 操作.识别2(标识.战斗界面) then
			keepScreen(false)
			return 战斗界面.to战斗胜利界面()
		end
		
		if 操作.或识别({标识.公告界面,标识.登录界面1},false) then
			keepScreen(false)
			执行任务.设置登录游戏流程()
			return 执行任务.登录游戏()
		end
		
		if 操作.或识别({标识.战斗胜利界面1,标识.战斗胜利界面2,标识.战斗胜利界面3},false) then
			keepScreen(false)
			return 战斗胜利界面.to战斗结算界面2()
		end
		
		if 操作.识别2(标识.战斗失败界面) then
			keepScreen(false)
			if 参数.组队方式~='单人' then
				return 战斗失败界面.to重邀界面()
			else
				return 战斗失败界面.to麒麟界面()
			end
		end
		
		if 操作.识别2(标识.战斗结算界面1) then
			keepScreen(false)
			return 战斗结算界面1.to战斗结算界面2()
		end
		
		if 操作.识别2(标识.战斗结算界面2) then
			keepScreen(false)
			if 参数.组队方式~='单人' then
				return 战斗结算界面2.to重邀界面()
			else	
				return 战斗结算界面2.to麒麟界面()
			end
		end
		
		if 操作.识别2(标识.战斗结算界面3) then
			keepScreen(false)
			if 参数.组队方式~='单人' then
				return 战斗结算界面3.to重邀界面()
			else 
				return 战斗结算界面3.to麒麟界面()
			end
		end
		
		if 操作.识别2(标识.重邀界面) then
			keepScreen(false)
			return 重邀界面.to房间界面()
		end
		
		if 操作.识别2(标识.个人突破界面) then
			keepScreen(false)
			操作.点击按钮(按钮.个人突破界面_退出按钮)
			mSleep(888)
			return 探索界面.to觉醒界面()
		end
		
		if 操作.识别2(标识.寮突破界面) then
			keepScreen(false)
			操作.点击按钮(按钮.寮突破界面_退出按钮)
			mSleep(888)
			return 探索界面.to觉醒界面()
		end
		
		if 操作.识别2(标识.购买体力界面) then
			keepScreen(false)
			return 购买体力界面.操作()
		end
		
		if 操作.识别2(标识.探索准备界面) then
			keepScreen(false)
			return 探索准备界面.to探索界面()
		end
		
		if 操作.识别2(标识.邮箱界面) then
			keepScreen(false)
			操作.点击按钮(按钮.邮箱界面_关闭)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.寮公告界面) then
			keepScreen(false)
			操作.点击按钮(按钮.寮公告界面_确定)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.召唤界面) then
			keepScreen(false)
			操作.点击按钮(按钮.召唤界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.结界界面) then
			keepScreen(false)
			操作.点击按钮(按钮.结界界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end	
		
		if 操作.识别2(标识.寄养界面) then
			keepScreen(false)
			寄养界面.退出()
		end
		
		if 操作.识别2(标识.buff界面) then
			keepScreen(false)
			操作.点击按钮(按钮.buff界面_退出区域)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.重连) then
			keepScreen(false)
			执行任务.等待重连()
		end
		
		if 操作.识别2(标识.登录动画界面) then
			keepScreen(false)
			mSleep(3000)
			if 操作.识别2(标识.登录动画界面) then
				执行任务.设置登录游戏流程()
				return 执行任务.登录游戏()
			end
		end
		
		if 参数.禁止聊天 then
			if 操作.识别点击(按钮.频道界面_关闭按钮,true) then
				keepScreen(false)
				mSleep(888)
				return 执行任务.重新识别()
			end
		
			if 操作.识别2(标识.聊天界面) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭按钮)
				mSleep(888)
				return 执行任务.重新识别()
			end
			
			if 操作.识别2(标识.聊天界面_好友信息) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭好友信息)
				mSleep(888)
				return 执行任务.重新识别()
			end
		end
		
		if 操作.识别点击(按钮.式神录界面_返回按钮,true) then
			keepScreen(false)
			mSleep(2000)
			return 执行任务.重新识别()
		end
		
		if 操作.或识别({标识.离岛界面,标识.离岛界面2},false) then
			keepScreen(false)
			操作.点击按钮(按钮.离岛界面_返回)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.道场（居酒屋）界面) then
			keepScreen(false)
			操作.点击按钮(按钮.道场（居酒屋）界面_关闭)
			mSleep(666)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.浮世澡堂界面) then
			keepScreen(false)
			操作.点击按钮(按钮.浮世澡堂界面_关闭)
			mSleep(666)
			return 执行任务.重新识别()
		end
		
		keepScreen(false)
		执行任务.检查闪退()
		mSleep(1000)
	end
	
	
end
----

-----------觉醒队员-----------
function 执行任务.觉醒队员()
	sysLog('重新识别界面中......')
	for i=1,2 do
		keepScreen(true)
		
		if 操作.识别2(标识.协作界面) then
			keepScreen(false)
			return 协作任务界面.处理()
		end
		
		if 操作.识别2(标识.超鬼王界面) then
			keepScreen(false)
			if 参数.交叉超鬼王 then
				return 执行任务.切换超鬼王()
			else
				操作.点击按钮(按钮.超鬼王界面_退出按钮)
				mSleep(300)
				return 探索界面.to觉醒界面()
			end
		end
		
		if 操作.或识别({标识.庭院界面1,标识.庭院界面2},false) then
			if 参数.智能开关buff and 参数.调整开关buff=='关' then
				keepScreen(false)
				庭院界面.开关buff()
			end
			
			if 参数.交叉离岛 or 参数.交叉寮突破 or 参数.交叉个人突破 or 参数.交叉超鬼王 or 参数.交叉死神 then
				keepScreen(false)
				庭院界面.切换副任务()
			end
		end
		
		if 操作.识别2(标识.探索界面) then
			if 参数.智能开关buff and 参数.调整开关buff=='关' then
				keepScreen(false)
				探索界面.开关buff()
			end
			
			if 参数.交叉离岛 or 参数.交叉寮突破 or 参数.交叉个人突破 or 参数.交叉超鬼王 or 参数.交叉死神 then
				keepScreen(false)
				探索界面.切换副任务(true)
			end
		end
		
		if 操作.识别2(标识.房间界面) then
			keepScreen(false)
			参数.cnt=8
			参数.等待邀请次数=0
			return 房间界面.to战斗准备界面（队员）()
		end
		
		if 操作.识别2(标识.房间邀请界面) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 房间邀请界面.to房间界面()
		end
		
		if 操作.识别2(标识.房间退出界面) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 房间退出界面.to创建队伍界面()
		end
		
		if 操作.识别2(标识.房间界面好友资料) then
			keepScreen(false)
			操作.点击按钮(按钮.房间界面好友资料_返回按钮)
			参数.cnt=8
			参数.等待邀请次数=0
			return 房间界面.to战斗准备界面（队员）()
		end
		
		if 操作.识别2(标识.战斗准备界面) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 战斗准备界面.to战斗界面()
		end
		
		if 操作.识别2(标识.战斗界面) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 战斗界面.to战斗胜利界面()
		end
		
		if 操作.或识别({标识.公告界面,标识.登录界面1},false) then
			keepScreen(false)
			参数.等待邀请次数=0
			执行任务.设置登录游戏流程()
			return 执行任务.登录游戏()
		end
		
		if 操作.或识别({标识.战斗胜利界面1,标识.战斗胜利界面2,标识.战斗胜利界面3},false) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 战斗胜利界面.to战斗结算界面2()
		end
		
		if 操作.识别2(标识.战斗失败界面) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 战斗失败界面.退出()
		end
		
		if 操作.识别2(标识.战斗结算界面1) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 战斗结算界面1.to战斗结算界面2()
		end
		
		if 操作.识别2(标识.战斗结算界面2) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 战斗结算界面2.领奖()
		end
		
		if 操作.识别2(标识.战斗结算界面3) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 战斗结算界面3.领奖()
		end
		
		if 操作.识别2(标识.购买体力界面) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 购买体力界面.操作()
		end
		
		if 操作.识别2(标识.邮箱界面) then
			keepScreen(false)
			操作.点击按钮(按钮.邮箱界面_关闭)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.寮公告界面) then
			keepScreen(false)
			操作.点击按钮(按钮.寮公告界面_确定)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.召唤界面) then
			keepScreen(false)
			操作.点击按钮(按钮.召唤界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.结界界面) then
			keepScreen(false)
			操作.点击按钮(按钮.结界界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end	
		
		if 操作.识别2(标识.寄养界面) then
			keepScreen(false)
			寄养界面.退出()
		end
		
		if 操作.识别2(标识.buff界面) then
			keepScreen(false)
			操作.点击按钮(按钮.buff界面_退出区域)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.重连) then
			keepScreen(false)
			参数.等待邀请次数=0
			执行任务.等待重连()
		end
		
		if 操作.识别2(标识.登录动画界面) then
			keepScreen(false)
			参数.等待邀请次数=0
			mSleep(3000)
			if 操作.识别2(标识.登录动画界面) then
				执行任务.设置登录游戏流程()
				return 执行任务.登录游戏()
			end
		end
		
		if 参数.禁止聊天 then
			if 操作.识别点击(按钮.频道界面_关闭按钮,true) then
				keepScreen(false)
				mSleep(888)
				return 执行任务.重新识别()
			end
		
			if 操作.识别2(标识.聊天界面) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭按钮)
				mSleep(888)
				return 执行任务.重新识别()
			end
			
			if 操作.识别2(标识.聊天界面_好友信息) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭好友信息)
				mSleep(888)
				return 执行任务.重新识别()
			end
		end
		
		if 操作.识别点击(按钮.式神录界面_返回按钮,true) then
			keepScreen(false)
			mSleep(2000)
			return 执行任务.重新识别()
		end
		
		if 操作.或识别({标识.离岛界面,标识.离岛界面2},false) then
			keepScreen(false)
			操作.点击按钮(按钮.离岛界面_返回)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.道场（居酒屋）界面) then
			keepScreen(false)
			操作.点击按钮(按钮.道场（居酒屋）界面_关闭)
			mSleep(666)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.浮世澡堂界面) then
			keepScreen(false)
			操作.点击按钮(按钮.浮世澡堂界面_关闭)
			mSleep(666)
			return 执行任务.重新识别()
		end
		
		keepScreen(false)
		执行任务.检查闪退()
		
		if 参数.队员首次全识别 then
			参数.队员首次全识别=false
			return 执行任务.等待邀请.等待()
		end
		
		mSleep(500)
	end
	
	return 执行任务.等待邀请.等待()
	
end
----

-------------探索-------------
function 执行任务.探索()
	sysLog('重新识别界面中......')
	while true do
		keepScreen(true)
		
		if 操作.识别2(标识.协作界面) then
			keepScreen(false)
			return 协作任务界面.处理()
		end
		
		if 操作.识别2(标识.超鬼王界面) then
			keepScreen(false)
			if 参数.交叉超鬼王 then
				return 执行任务.切换超鬼王()
			else
				操作.点击按钮(按钮.超鬼王界面_退出按钮)
				mSleep(300)
				return 探索界面.to探索准备界面()
			end
		end
		
		if 操作.或识别({标识.庭院界面1,标识.庭院界面2},false) then
			keepScreen(false)
			return 庭院界面.to探索界面()
		end
		
		if 操作.识别2(标识.探索界面) then
			keepScreen(false)
			if 参数.智能开关buff and 参数.调整开关buff~='保持' then
				探索界面.开关buff()
			end
			return 探索界面.to探索准备界面()
		end
		
		if 操作.识别2(标识.探索邀请界面) then
			keepScreen(false)
			if 参数.探索组队类型=='队长' then
				return 探索邀请界面.to探索关卡界面()
			else
				return 探索邀请界面.to探索准备界面()
			end
		end
		
		if 操作.识别2(标识.购买体力界面) then
			keepScreen(false)
			return 购买体力界面.操作()
		end
		
		if 操作.识别2(标识.探索准备界面) then
			keepScreen(false)
			return 探索准备界面.to探索界面()
		end
		
		if 操作.识别2(标识.探索创建队伍界面) then
			keepScreen(false)
			return 探索创建队伍界面.to组队界面()
		end
		
		if 操作.识别2(标识.房间界面) then
			keepScreen(false)
			return 房间界面.to探索关卡界面()
		end
		
		if 操作.识别2(标识.房间邀请界面) then
			keepScreen(false)
			return 房间邀请界面.to房间界面()
		end
		
		if 操作.识别2(标识.房间退出界面) then
			keepScreen(false)
			return 房间退出界面.to探索界面()
		end
		
		if 操作.识别2(标识.房间界面好友资料) then
			keepScreen(false)
			房间界面好友资料.返回()
		end
		
		if 操作.识别2(标识.探索关卡界面) then
			keepScreen(false)
			return 探索关卡界面.to战斗准备界面()
		end
		
		if 操作.识别2(标识.战斗准备界面) then
			keepScreen(false)
			return 战斗准备界面.to战斗界面()
		end
		
		if 操作.识别2(标识.寄养界面) then
			keepScreen(false)
			寄养界面.退出()
		end
		
		if 操作.识别2(标识.换狗粮界面) then
			keepScreen(false)
			return 换狗粮界面.to战斗准备界面()
		end
		
		if 操作.识别2(标识.选稀有度界面) then
			keepScreen(false)
			选稀有度界面.选稀有度()
			return 换狗粮界面.to战斗准备界面()
		end
		
		if 操作.识别2(标识.战斗界面) then
			keepScreen(false)
			return 战斗界面.to战斗胜利界面()
		end
		
		if 操作.或识别({标识.公告界面,标识.登录界面1},false) then
			keepScreen(false)
			执行任务.设置登录游戏流程()
			return 执行任务.登录游戏()
		end
		
		if 操作.或识别({标识.战斗胜利界面1,标识.战斗胜利界面2,标识.战斗胜利界面3},false) then
			keepScreen(false)
			return 战斗胜利界面.to战斗结算界面2()
		end
		
		if 操作.识别2(标识.战斗失败界面) then
			keepScreen(false)
			return 战斗失败界面.to探索关卡界面()
		end
		
		if 操作.识别2(标识.战斗结算界面1) then
			keepScreen(false)
			return 战斗结算界面1.to战斗结算界面2()
		end
		
		if 操作.识别2(标识.战斗结算界面2) then
			keepScreen(false)
			return 战斗结算界面2.to探索关卡界面()
		end
		
		if 操作.识别2(标识.战斗结算界面2_御魂超出上限) then
			keepScreen(false)
			参数.御魂超出上限=true
			操作.点击按钮(按钮.战斗结算界面2_御魂超出上限确定按钮)
			mSleep(666)
			return 战斗结算界面2.to探索关卡界面()
		end
		
		if 操作.识别2(标识.战斗结算界面3) then
			keepScreen(false)
			return 战斗结算界面3.to探索关卡界面()
		end
		
		if 参数.探索组队类型=='队长' then
			if 操作.识别2(标识.重邀界面) then
				keepScreen(false)
				return 重邀界面.to探索邀请界面()
			end
		end
		
		if 操作.识别2(标识.探索关卡退出界面) then
			keepScreen(false)
			sysLog('2秒后退出关卡')
			mSleep(1000)
			sysLog('1秒后退出关卡')
			mSleep(1000)
			return 探索关卡退出界面.退出()
		end
		
--		if 操作.识别2(标识.探索关卡界面_经验酒壶满) then
--			keepScreen(false)
--			return 经验酒壶满界面.取消()
--		end
		
		if 操作.识别2(标识.个人突破界面) then
			keepScreen(false)
			操作.点击按钮(按钮.个人突破界面_退出按钮)
			mSleep(888)
			return 探索界面.to探索准备界面()
		end
		
		if 操作.识别2(标识.寮突破界面) then
			keepScreen(false)
			操作.点击按钮(按钮.寮突破界面_退出按钮)
			mSleep(888)
			return 探索界面.to探索准备界面()
		end
		
		if 操作.识别2(标识.邮箱界面) then
			keepScreen(false)
			操作.点击按钮(按钮.邮箱界面_关闭)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.寮公告界面) then
			keepScreen(false)
			操作.点击按钮(按钮.寮公告界面_确定)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.召唤界面) then
			keepScreen(false)
			操作.点击按钮(按钮.召唤界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.结界界面) then
			keepScreen(false)
			操作.点击按钮(按钮.结界界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end	
		
		if 操作.识别2(标识.buff界面) then
			keepScreen(false)
			操作.点击按钮(按钮.buff界面_退出区域)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.重连) then
			keepScreen(false)
			执行任务.等待重连()
		end
		
		if 操作.识别2(标识.登录动画界面) then
			keepScreen(false)
			mSleep(3000)
			if 操作.识别2(标识.登录动画界面) then
				执行任务.设置登录游戏流程()
				return 执行任务.登录游戏()
			end
		end
		
		if 参数.禁止聊天 then
			if 操作.识别点击(按钮.频道界面_关闭按钮,true) then
				keepScreen(false)
				mSleep(888)
				return 执行任务.重新识别()
			end
		
			if 操作.识别2(标识.聊天界面) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭按钮)
				mSleep(888)
				return 执行任务.重新识别()
			end
			
			if 操作.识别2(标识.聊天界面_好友信息) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭好友信息)
				mSleep(888)
				return 执行任务.重新识别()
			end
		end
		
		if 操作.识别点击(按钮.式神录界面_返回按钮,true) then
			keepScreen(false)
			mSleep(2000)
			return 执行任务.重新识别()
		end
		
		if 操作.或识别({标识.离岛界面,标识.离岛界面2},false) then
			keepScreen(false)
			操作.点击按钮(按钮.离岛界面_返回)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.道场（居酒屋）界面) then
			keepScreen(false)
			操作.点击按钮(按钮.道场（居酒屋）界面_关闭)
			mSleep(666)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.浮世澡堂界面) then
			keepScreen(false)
			操作.点击按钮(按钮.浮世澡堂界面_关闭)
			mSleep(666)
			return 执行任务.重新识别()
		end
		
		keepScreen(false)
		执行任务.检查闪退()
		mSleep(1000)
	end
	
end
----

-----------探索队员-----------
function 执行任务.探索队员()
	sysLog('重新识别界面中......')
	for i=1,2 do
		keepScreen(true)
		
		if 操作.识别2(标识.协作界面) then
			keepScreen(false)
			return 协作任务界面.处理()
		end
		
		if 操作.识别2(标识.超鬼王界面) then
			keepScreen(false)
			if 参数.交叉超鬼王 then
				return 执行任务.切换超鬼王()
			else
				操作.点击按钮(按钮.超鬼王界面_退出按钮)
				mSleep(300)
				return 探索界面.to探索准备界面()
			end
		end
		
		if 操作.或识别({标识.庭院界面1,标识.庭院界面2},false) then
			if 参数.智能开关buff and 参数.调整开关buff=='关' then
				keepScreen(false)
				庭院界面.开关buff()
			end
			
			if 参数.交叉离岛 or 参数.交叉寮突破 or 参数.交叉个人突破 or 参数.交叉超鬼王 or 参数.交叉死神 then
				keepScreen(false)
				庭院界面.切换副任务()
			end
		end

		if 操作.识别2(标识.探索界面) then
			if 参数.智能开关buff and 参数.调整开关buff=='关' then
				keepScreen(false)
				探索界面.开关buff()
			end
			
			if 参数.交叉离岛 or 参数.交叉寮突破 or 参数.交叉个人突破 or 参数.交叉超鬼王 or 参数.交叉死神 then
				keepScreen(false)
				探索界面.切换副任务(true)
			end
			
			if not(参数.已检查探索宝箱) then
				if 操作.识别2(标识.探索界面_探索发现) then
					keepScreen(false)
					while true do
						local 无遮挡=true
--						if 操作.识别点击(按钮.真蛇消息关闭按钮,true) then
--							无遮挡=false
--						end
						if 参数.探索优先接受邀请 then
							if 操作.或识别({按钮.接受邀请按钮, 按钮.接受邀请按钮2}, false) then
								return 执行任务.等待邀请.等待()
							end
						elseif 操作.识别点击(按钮.拒绝邀请按钮,true) then
							无遮挡=false
						end
						if 无遮挡 then
							break
						end
						mSleep(1500)
					end
					
					if not(操作.识别点击(按钮.探索界面_宝箱发现,true)) then
						if 参数.交叉死神 then
							if 操作.识别点击(按钮.探索界面_死神发现,true) then 
								参数.自己发现的死神=true
								mSleep(2000)
								return 执行任务.切换死神()
							end
						end
						if 参数.交叉年兽 then
							if 操作.识别点击(按钮.探索界面_年兽发现,true) then 
								参数.自己发现的年兽=true
								mSleep(2000)
								return 执行任务.切换年兽()
							end
						end
						if 操作.识别2(标识.探索界面_探索发现_多页) then
							操作.滑动(68,191,86,96)
							mSleep(1000)
							if 操作.识别点击(按钮.探索界面_宝箱发现,true) then
								mSleep(1500)
								return 战斗结算界面1.to战斗结算界面2()
							else
								if 参数.交叉死神 then 
									if 操作.识别点击(按钮.探索界面_死神发现,true) then 
										参数.自己发现的死神=true
										mSleep(2000)
										return 执行任务.切换死神()
									end 
								end
								if 参数.交叉年兽 then
									if 操作.识别点击(按钮.探索界面_年兽发现,true) then 
										参数.自己发现的年兽=true
										mSleep(2000)
										return 执行任务.切换年兽()
									end
								end
							end
						end
					else
						mSleep(1500)
						return 战斗结算界面1.to战斗结算界面2()
					end
					参数.已检查探索宝箱=true
					keepScreen(true)
				end
			end
		end
		
		if 操作.识别2(标识.房间界面) then
			keepScreen(false)
			参数.cnt=8
			参数.等待邀请次数=0
			return 房间界面.to战斗准备界面（队员）()
		end
		
		if 操作.识别2(标识.探索关卡界面) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 探索关卡界面.to战斗准备界面（队员）()
		end
		
		if 操作.识别2(标识.战斗准备界面) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 战斗准备界面.to战斗界面()
		end
		
		if 操作.识别2(标识.寄养界面) then
			keepScreen(false)
			寄养界面.退出()
		end
		
		if 操作.识别2(标识.换狗粮界面) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 换狗粮界面.to战斗准备界面()
		end
		
		if 操作.识别2(标识.选稀有度界面) then
			keepScreen(false)
			参数.等待邀请次数=0
			选稀有度界面.选稀有度()
			return 换狗粮界面.to战斗准备界面()
		end
		
		if 操作.识别2(标识.战斗界面) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 战斗界面.to战斗胜利界面()
		end
		
		if 操作.或识别({标识.公告界面,标识.登录界面1},false) then
			keepScreen(false)
			参数.等待邀请次数=0
			执行任务.设置登录游戏流程()
			return 执行任务.登录游戏()
		end
		
		if 操作.或识别({标识.战斗胜利界面1,标识.战斗胜利界面2,标识.战斗胜利界面3},false) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 战斗胜利界面.to战斗结算界面2()
		end
		
		if 操作.识别2(标识.战斗失败界面) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 战斗失败界面.to探索关卡界面()
		end
		
		if 操作.识别2(标识.战斗结算界面1) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 战斗结算界面1.to战斗结算界面2()
		end
		
		if 操作.识别2(标识.战斗结算界面2) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 战斗结算界面2.to探索关卡界面()
		end
		
		if 操作.识别2(标识.战斗结算界面2_御魂超出上限) then
			keepScreen(false)
			参数.御魂超出上限=true
			操作.点击按钮(按钮.战斗结算界面2_御魂超出上限确定按钮)
			mSleep(666)
			return 战斗结算界面2.to探索关卡界面()
		end
		
		if 操作.识别2(标识.战斗结算界面3) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 战斗结算界面3.to探索关卡界面()
		end
		
		if 操作.识别2(标识.探索关卡退出界面) then
			keepScreen(false)
			参数.等待邀请次数=0
			sysLog('2秒后退出关卡')
			mSleep(1000)
			sysLog('1秒后退出关卡')
			mSleep(1000)
			return 探索关卡退出界面.退出()
		end
		
		if 操作.识别2(标识.购买体力界面) then
			keepScreen(false)
			参数.等待邀请次数=0
			return 购买体力界面.操作()
		end
		
		if 操作.识别2(标识.探索准备界面) then
			keepScreen(false)
			return 探索准备界面.to探索界面()
		end
		
		if 操作.识别2(标识.邮箱界面) then
			keepScreen(false)
			操作.点击按钮(按钮.邮箱界面_关闭)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.寮公告界面) then
			keepScreen(false)
			操作.点击按钮(按钮.寮公告界面_确定)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.召唤界面) then
			keepScreen(false)
			操作.点击按钮(按钮.召唤界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.结界界面) then
			keepScreen(false)
			操作.点击按钮(按钮.结界界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end	
		
		if 操作.识别2(标识.buff界面) then
			keepScreen(false)
			操作.点击按钮(按钮.buff界面_退出区域)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.重连) then
			keepScreen(false)
			参数.等待邀请次数=0
			执行任务.等待重连()
		end
		
		if 操作.识别2(标识.登录动画界面) then
			keepScreen(false)
			参数.等待邀请次数=0
			mSleep(3000)
			if 操作.识别2(标识.登录动画界面) then
				执行任务.设置登录游戏流程()
				return 执行任务.登录游戏()
			end
		end
		
		if 参数.禁止聊天 then
			if 操作.识别点击(按钮.频道界面_关闭按钮,true) then
				keepScreen(false)
				mSleep(888)
				return 执行任务.重新识别()
			end
		
			if 操作.识别2(标识.聊天界面) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭按钮)
				mSleep(888)
				return 执行任务.重新识别()
			end
			
			if 操作.识别2(标识.聊天界面_好友信息) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭好友信息)
				mSleep(888)
				return 执行任务.重新识别()
			end
		end
		
		if 操作.识别点击(按钮.式神录界面_返回按钮,true) then
			keepScreen(false)
			mSleep(2000)
			return 执行任务.重新识别()
		end
		
		if 操作.或识别({标识.离岛界面,标识.离岛界面2},false) then
			keepScreen(false)
			操作.点击按钮(按钮.离岛界面_返回)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.道场（居酒屋）界面) then
			keepScreen(false)
			操作.点击按钮(按钮.道场（居酒屋）界面_关闭)
			mSleep(666)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.浮世澡堂界面) then
			keepScreen(false)
			操作.点击按钮(按钮.浮世澡堂界面_关闭)
			mSleep(666)
			return 执行任务.重新识别()
		end
		
		keepScreen(false)
		执行任务.检查闪退()
		
		if 参数.队员首次全识别 then
			参数.队员首次全识别=false
			return 执行任务.等待邀请.等待()
		end
		
		mSleep(500)
	end
	
	return 执行任务.等待邀请.等待()
	
end
----

-----------个人突破------------
function 执行任务.个人突破()
	sysLog('重新识别界面中......')
	while true do
		keepScreen(true)
		
		if 操作.识别2(标识.协作界面) then
			keepScreen(false)
			return 协作任务界面.处理()
		end
		
		if 操作.识别2(标识.超鬼王界面) then
			keepScreen(false)
			if 参数.交叉超鬼王 then
				return 执行任务.切换超鬼王()
			else
				操作.点击按钮(按钮.超鬼王界面_退出按钮)
				mSleep(300)
				return 探索界面.to个人突破界面()
			end
		end
		
		if 操作.或识别({标识.庭院界面1,标识.庭院界面2},false) then
			keepScreen(false)
			return 庭院界面.to探索界面()
		end
		
		if 操作.识别2(标识.探索界面) then
			keepScreen(false)
			if 参数.智能开关buff and 参数.调整开关buff~='保持' then
				探索界面.开关buff()
			end
			return 探索界面.to个人突破界面()
		end
		
		if 操作.识别2(标识.个人突破界面) then
			keepScreen(false)
			return 个人突破界面.to个人突破准备界面()
		end
		
		if 操作.识别2(标识.个人突破刷新界面) then
			keepScreen(false)
			return 个人突破刷新界面.to个人突破界面()
		end
		
		if 操作.识别2(标识.个人突破准备界面) then
			keepScreen(false)
			return 个人突破准备界面.to个人突破界面()
		end
		
		if 操作.识别2(标识.战斗准备界面) then
			keepScreen(false)
			return 战斗准备界面.to战斗界面()
		end
		
		if 操作.识别2(标识.战斗界面) then
			keepScreen(false)
			return 战斗界面.to战斗胜利界面()
		end
		
		if 操作.或识别({标识.公告界面,标识.登录界面1},false) then
			keepScreen(false)
			执行任务.设置登录游戏流程()
			return 执行任务.登录游戏()
		end
		
		if 操作.或识别({标识.战斗胜利界面1,标识.战斗胜利界面2,标识.战斗胜利界面3},false) then
			keepScreen(false)
			return 战斗胜利界面.to战斗结算界面2()
		end
		
		if 操作.识别2(标识.战斗失败界面) then
			keepScreen(false)
			return 战斗失败界面.to个人突破界面()
		end
		
		if 操作.识别2(标识.战斗结算界面1) then
			keepScreen(false)
			return 战斗结算界面1.to战斗结算界面2()
		end
		
		if 操作.识别2(标识.战斗结算界面2) then
			keepScreen(false)
			return 战斗结算界面2.to个人突破界面()
		end
		
		if 操作.识别2(标识.战斗结算界面3) then
			keepScreen(false)
			return 战斗结算界面3.to个人突破界面()
		end
		
		if 参数.交叉个人突破 then
			if 操作.识别2(标识.房间界面) then
				keepScreen(false)
				参数.cnt=8
				return 房间界面.to探索界面()
			end
			
			if 操作.识别2(标识.创建队伍界面) then
				keepScreen(false)
				return 创建队伍界面.to组队界面()
			end
			 
			if 操作.识别2(标识.组队界面) then
				keepScreen(false)
				if 参数.任务=='大蛇' then
					return 组队界面.to大蛇界面()
				elseif 参数.任务=='觉醒' then
					return 组队界面.to麒麟界面()
				elseif 参数.任务=='卑弥呼' then
					return 组队界面.to卑弥呼界面()
				else
					return 组队界面.to庭院界面()
				end
			end
			
			if 操作.识别2(标识.大蛇界面) then
				keepScreen(false)
				return 大蛇界面.to探索界面()
			end
			
			if 操作.识别2(标识.卑弥呼界面) then
				keepScreen(false)
				return 卑弥呼界面.to探索界面()
			end
			
			if 操作.或识别({标识.麒麟界面1,标识.麒麟界面2},false) then
				keepScreen(false)
				return 麒麟界面.to探索界面()
			end
			
			if 操作.识别2(标识.业原火界面) then
				keepScreen(false)
				return 业原火界面.to探索界面()
			end
			
			if 操作.识别2(标识.神兽界面) then
				keepScreen(false)
				return 神兽界面.to探索界面()
			end
			
			if 操作.识别2(标识.大江山之战界面) then
				keepScreen(false)
				return 大江山之战界面.to庭院界面()
			end
			
			if 操作.识别2(标识.修罗战场界面) then
				keepScreen(false)
				return 修罗战场界面.to大江山之战界面()
			end
			
			if 操作.识别2(标识.海国退治界面) then
				keepScreen(false)
				return 海国退治界面.to大江山之战界面()
			end
		end
		
		if 操作.或识别({标识.离岛界面,标识.离岛界面2},false) then
			keepScreen(false)
			return 离岛界面.to庭院界面()
		end
		
		if 操作.识别2(标识.道场（居酒屋）界面) then
			keepScreen(false)
			return 道场（居酒屋）界面.to离岛界面()
		end
		
		if 操作.识别2(标识.浮世澡堂界面) then
			keepScreen(false)
			return 浮世澡堂界面.to离岛界面()
		end
		
		if 操作.识别2(标识.购买体力界面) then
			keepScreen(false)
			return 购买体力界面.操作()
		end
		
		if 操作.识别2(标识.探索准备界面) then
			keepScreen(false)
			return 探索准备界面.to探索界面()
		end
		
		if 操作.识别2(标识.邮箱界面) then
			keepScreen(false)
			操作.点击按钮(按钮.邮箱界面_关闭)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.寮公告界面) then
			keepScreen(false)
			操作.点击按钮(按钮.寮公告界面_确定)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.召唤界面) then
			keepScreen(false)
			操作.点击按钮(按钮.召唤界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.结界界面) then
			keepScreen(false)
			操作.点击按钮(按钮.结界界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end	
		
		if 操作.识别2(标识.寄养界面) then
			keepScreen(false)
			寄养界面.退出()
		end
		
		if 操作.识别2(标识.buff界面) then
			keepScreen(false)
			操作.点击按钮(按钮.buff界面_退出区域)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.重连) then
			keepScreen(false)
			执行任务.等待重连()
		end
		
		if 操作.识别2(标识.登录动画界面) then
			keepScreen(false)
			mSleep(3000)
			if 操作.识别2(标识.登录动画界面) then
				执行任务.设置登录游戏流程()
				return 执行任务.登录游戏()
			end
		end
		
		if 参数.禁止聊天 then
			if 操作.识别点击(按钮.频道界面_关闭按钮,true) then
				keepScreen(false)
				mSleep(888)
				return 执行任务.重新识别()
			end
		
			if 操作.识别2(标识.聊天界面) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭按钮)
				mSleep(888)
				return 执行任务.重新识别()
			end
			
			if 操作.识别2(标识.聊天界面_好友信息) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭好友信息)
				mSleep(888)
				return 执行任务.重新识别()
			end
		end
		
		if 操作.识别点击(按钮.式神录界面_返回按钮,true) then
			keepScreen(false)
			mSleep(2000)
			return 执行任务.重新识别()
		end
		
		keepScreen(false)
		执行任务.检查闪退()
		mSleep(1000)
	end
end
----

------------寮突破------------
function 执行任务.寮突破()
	sysLog('重新识别界面中......')
	while true do
		keepScreen(true)
		
		if 操作.识别2(标识.协作界面) then
			keepScreen(false)
			return 协作任务界面.处理()
		end
		
		if 操作.识别2(标识.超鬼王界面) then
			keepScreen(false)
			if 参数.交叉超鬼王 then
				return 执行任务.切换超鬼王()
			else
				操作.点击按钮(按钮.超鬼王界面_退出按钮)
				mSleep(300)
				return 探索界面.to探索准备界面()
			end
		end
		
		if 操作.或识别({标识.庭院界面1,标识.庭院界面2},false) then
			keepScreen(false)
			return 庭院界面.to探索界面()
		end
		
		if 操作.识别2(标识.探索界面) then
			keepScreen(false)
			if 参数.智能开关buff and 参数.调整开关buff~='保持' then
				探索界面.开关buff()
			end
			return 探索界面.to个人突破界面()
		end
		
		if 操作.识别2(标识.个人突破界面) then
			keepScreen(false)
			return 个人突破界面.to寮突破界面()
		end
		
		if 操作.识别2(标识.寮突破界面) then
			keepScreen(false)
			return 寮突破界面.to寮突破准备界面()
		end
		
		if 操作.识别2(标识.寮突破准备界面) then
			keepScreen(false)
			return 寮突破准备界面.to探索界面()
		end
		
		if 操作.识别2(标识.战斗准备界面) then
			keepScreen(false)
			return 战斗准备界面.to战斗界面()
		end
		
		if 操作.识别2(标识.战斗界面) then
			keepScreen(false)
			return 战斗界面.to战斗胜利界面()
		end
		
		if 操作.或识别({标识.公告界面,标识.登录界面1},false) then
			keepScreen(false)
			执行任务.设置登录游戏流程()
			return 执行任务.登录游戏()
		end
		
		if 操作.或识别({标识.战斗胜利界面1,标识.战斗胜利界面2,标识.战斗胜利界面3},false) then
			keepScreen(false)
			return 战斗胜利界面.to战斗结算界面2()
		end
		
		if 操作.识别2(标识.战斗失败界面) then
			keepScreen(false)
			return 战斗失败界面.to寮突破界面()
		end
		
		if 操作.识别2(标识.战斗结算界面1) then
			keepScreen(false)
			return 战斗结算界面1.to战斗结算界面2()
		end
		
		if 操作.识别2(标识.战斗结算界面2) then
			keepScreen(false)
			return 战斗结算界面2.to寮突破界面()
		end
		
		if 操作.识别2(标识.战斗结算界面3) then
			keepScreen(false)
			return 战斗结算界面3.to寮突破界面()
		end
		
		if 参数.交叉寮突破 then
			if 操作.识别2(标识.房间界面) then
				keepScreen(false)
				参数.cnt=8
				return 房间界面.to探索界面()
			end
			
			if 操作.识别2(标识.创建队伍界面) then
				keepScreen(false)
				return 创建队伍界面.to组队界面()
			end
			
			if 操作.识别2(标识.组队界面) then
				keepScreen(false)
				if 参数.任务=='大蛇' then
					return 组队界面.to大蛇界面()
				elseif 参数.任务=='觉醒' then
					return 组队界面.to麒麟界面()
				elseif 参数.任务=='卑弥呼' then
					return 组队界面.to卑弥呼界面()
				else
					return 组队界面.to庭院界面()
				end
			end
			
			if 操作.识别2(标识.大蛇界面) then
				keepScreen(false)
				return 大蛇界面.to探索界面()
			end
			
			if 操作.识别2(标识.卑弥呼界面) then
				keepScreen(false)
				return 卑弥呼界面.to探索界面()
			end
			
			if 操作.或识别({标识.麒麟界面1,标识.麒麟界面2},false) then
				keepScreen(false)
				return 麒麟界面.to探索界面()
			end
			
			if 操作.识别2(标识.业原火界面) then
				keepScreen(false)
				return 业原火界面.to探索界面()
			end	
			
			if 操作.识别2(标识.神兽界面) then
				keepScreen(false)
				return 神兽界面.to探索界面()
			end
			
			if 操作.识别2(标识.大江山之战界面) then
				keepScreen(false)
				return 大江山之战界面.to庭院界面()
			end
			
			if 操作.识别2(标识.修罗战场界面) then
				keepScreen(false)
				return 修罗战场界面.to大江山之战界面()
			end
			
			if 操作.识别2(标识.海国退治界面) then
				keepScreen(false)
				return 海国退治界面.to大江山之战界面()
			end
			
		end
		
		if 操作.或识别({标识.离岛界面,标识.离岛界面2},false) then
			keepScreen(false)
			return 离岛界面.to庭院界面()
		end
		
		if 操作.识别2(标识.道场（居酒屋）界面) then
			keepScreen(false)
			return 道场（居酒屋）界面.to离岛界面()
		end
		
		if 操作.识别2(标识.浮世澡堂界面) then
			keepScreen(false)
			return 浮世澡堂界面.to离岛界面()
		end
		
		if 操作.识别2(标识.购买体力界面) then
			keepScreen(false)
			return 购买体力界面.操作()
		end
		
		if 操作.识别2(标识.探索准备界面) then
			keepScreen(false)
			return 探索准备界面.to探索界面()
		end
		
		if 操作.识别2(标识.邮箱界面) then
			keepScreen(false)
			操作.点击按钮(按钮.邮箱界面_关闭)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.寮公告界面) then
			keepScreen(false)
			操作.点击按钮(按钮.寮公告界面_确定)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.召唤界面) then
			keepScreen(false)
			操作.点击按钮(按钮.召唤界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.结界界面) then
			keepScreen(false)
			操作.点击按钮(按钮.结界界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end	
		
		if 操作.识别2(标识.寄养界面) then
			keepScreen(false)
			寄养界面.退出()
		end
		
		if 操作.识别2(标识.buff界面) then
			keepScreen(false)
			操作.点击按钮(按钮.buff界面_退出区域)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.重连) then
			keepScreen(false)
			执行任务.等待重连()
		end
		
		if 操作.识别2(标识.登录动画界面) then
			keepScreen(false)
			mSleep(3000)
			if 操作.识别2(标识.登录动画界面) then
				执行任务.设置登录游戏流程()
				return 执行任务.登录游戏()
			end
		end
		
		if 参数.禁止聊天 then
			if 操作.识别点击(按钮.频道界面_关闭按钮,true) then
				keepScreen(false)
				mSleep(888)
				return 执行任务.重新识别()
			end
		
			if 操作.识别2(标识.聊天界面) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭按钮)
				mSleep(888)
				return 执行任务.重新识别()
			end
			
			if 操作.识别2(标识.聊天界面_好友信息) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭好友信息)
				mSleep(888)
				return 执行任务.重新识别()
			end
		end
		
		if 操作.识别点击(按钮.式神录界面_返回按钮,true) then
			keepScreen(false)
			mSleep(2000)
			return 执行任务.重新识别()
		end
		
		keepScreen(false)
		执行任务.检查闪退()
		mSleep(1000)
	end
end
----

------------业原火------------
function 执行任务.业原火()
	sysLog('重新识别界面中......')
	while true do
		keepScreen(true)
		
		if 操作.识别2(标识.协作界面) then
			keepScreen(false)
			return 协作任务界面.处理()
		end
		
		if 操作.识别2(标识.超鬼王界面) then
			keepScreen(false)
			if 参数.交叉超鬼王 then
				return 执行任务.切换超鬼王()
			else
				操作.点击按钮(按钮.超鬼王界面_退出按钮)
				mSleep(300)
				return 探索界面.to御魂界面()
			end
		end
		
		if 操作.或识别({标识.庭院界面1,标识.庭院界面2},false) then
			keepScreen(false)
			return 庭院界面.to探索界面()
		end
		
		if 操作.识别2(标识.探索界面) then
			keepScreen(false)
			if 参数.智能开关buff and 参数.调整开关buff~='保持' then
				探索界面.开关buff()
			end
			return 探索界面.to御魂界面()
		end
		
		if 操作.识别2(标识.御魂界面) then
			keepScreen(false)
			return 御魂界面.to业原火界面()
		end
		
		if 操作.识别2(标识.业原火界面) then
			keepScreen(false)
			return 业原火界面.to战斗准备界面()
		end	
		
		if 操作.识别2(标识.战斗准备界面) then
			keepScreen(false)
			return 战斗准备界面.to战斗界面()
		end
		
		if 操作.识别2(标识.战斗界面) then
			keepScreen(false)
			return 战斗界面.to战斗胜利界面()
		end
		
		if 操作.或识别({标识.公告界面,标识.登录界面1},false) then
			keepScreen(false)
			执行任务.设置登录游戏流程()
			return 执行任务.登录游戏()
		end
		
		if 操作.或识别({标识.战斗胜利界面1,标识.战斗胜利界面2,标识.战斗胜利界面3},false) then
			keepScreen(false)
			return 战斗胜利界面.to战斗结算界面2()
		end
		
		if 操作.识别2(标识.战斗失败界面) then
			keepScreen(false)
			return 战斗失败界面.to业原火界面()
		end
		
		if 操作.识别2(标识.战斗结算界面1) then
			keepScreen(false)
			return 战斗结算界面1.to战斗结算界面2()
		end
		
		if 操作.识别2(标识.战斗结算界面2) then
			keepScreen(false)
			return 战斗结算界面2.to业原火界面()
		end
		
		if 操作.识别2(标识.战斗结算界面3) then
			keepScreen(false)
			return 战斗结算界面3.to业原火界面()
		end
		
		if 操作.识别2(标识.寄养界面) then
			keepScreen(false)
			寄养界面.退出()
		end
		
		if 参数.御魂换狗粮 then
			if 操作.识别2(标识.换狗粮界面) then
				keepScreen(false)
				return 换狗粮界面.to战斗准备界面（御魂）()
			end
			
			if 操作.识别2(标识.选稀有度界面) then
				keepScreen(false)
				选稀有度界面.选稀有度()
				return 换狗粮界面.to战斗准备界面（御魂）()
			end
		end
		
		if 操作.识别2(标识.个人突破界面) then
			keepScreen(false)
			操作.点击按钮(按钮.个人突破界面_退出按钮)
			mSleep(888)
			return 探索界面.to御魂界面()
		end
		
		if 操作.识别2(标识.寮突破界面) then
			keepScreen(false)
			操作.点击按钮(按钮.寮突破界面_退出按钮)
			mSleep(888)
			return 探索界面.to御魂界面()
		end
		
		if 操作.识别2(标识.探索准备界面) then
			keepScreen(false)
			return 探索准备界面.to探索界面()
		end
		
		if 操作.识别2(标识.邮箱界面) then
			keepScreen(false)
			操作.点击按钮(按钮.邮箱界面_关闭)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.寮公告界面) then
			keepScreen(false)
			操作.点击按钮(按钮.寮公告界面_确定)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.召唤界面) then
			keepScreen(false)
			操作.点击按钮(按钮.召唤界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.结界界面) then
			keepScreen(false)
			操作.点击按钮(按钮.结界界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end	
		
		if 操作.识别2(标识.buff界面) then
			keepScreen(false)
			操作.点击按钮(按钮.buff界面_退出区域)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.战斗结算界面2_御魂超出上限) then
			keepScreen(false)
			参数.御魂超出上限=true
			操作.点击按钮(按钮.战斗结算界面2_御魂超出上限确定按钮)
			mSleep(666)
			return 战斗结算界面2.to业原火界面()
		end
		
		if 操作.识别2(标识.重连) then
			keepScreen(false)
			执行任务.等待重连()
		end
		
		if 操作.识别2(标识.登录动画界面) then
			keepScreen(false)
			mSleep(3000)
			if 操作.识别2(标识.登录动画界面) then
				执行任务.设置登录游戏流程()
				return 执行任务.登录游戏()
			end
		end
		
		if 参数.禁止聊天 then
			if 操作.识别点击(按钮.频道界面_关闭按钮,true) then
				keepScreen(false)
				mSleep(888)
				return 执行任务.重新识别()
			end
		
			if 操作.识别2(标识.聊天界面) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭按钮)
				mSleep(888)
				return 执行任务.重新识别()
			end
			
			if 操作.识别2(标识.聊天界面_好友信息) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭好友信息)
				mSleep(888)
				return 执行任务.重新识别()
			end
		end
		
		if 操作.识别点击(按钮.式神录界面_返回按钮,true) then
			keepScreen(false)
			mSleep(2000)
			return 执行任务.重新识别()
		end
		
		if 操作.或识别({标识.离岛界面,标识.离岛界面2},false) then
			keepScreen(false)
			操作.点击按钮(按钮.离岛界面_返回)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.道场（居酒屋）界面) then
			keepScreen(false)
			操作.点击按钮(按钮.道场（居酒屋）界面_关闭)
			mSleep(666)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.浮世澡堂界面) then
			keepScreen(false)
			操作.点击按钮(按钮.浮世澡堂界面_关闭)
			mSleep(666)
			return 执行任务.重新识别()
		end
		
		keepScreen(false)
		执行任务.检查闪退()
		mSleep(1000)
	end
end
----

------------御灵------------
function 执行任务.御灵()
	sysLog('重新识别界面中......')
	while true do
		keepScreen(true)
		
		if 操作.识别2(标识.协作界面) then
			keepScreen(false)
			return 协作任务界面.处理()
		end
		
		if 操作.识别2(标识.超鬼王界面) then
			keepScreen(false)
			if 参数.交叉超鬼王 then
				return 执行任务.切换超鬼王()
			else
				操作.点击按钮(按钮.超鬼王界面_退出按钮)
				mSleep(300)
				return 探索界面.to御灵界面()
			end
		end
		
		if 操作.或识别({标识.庭院界面1,标识.庭院界面2},false) then
			keepScreen(false)
			return 庭院界面.to探索界面()
		end
		
		if 操作.识别2(标识.探索界面) then
			keepScreen(false)
			if 参数.智能开关buff and 参数.调整开关buff~='保持' then
				探索界面.开关buff()
			end
			return 探索界面.to御灵界面()
		end
		
		if 操作.或识别({标识.御灵界面1, 标识.御灵界面2}, false) then
			keepScreen(false)
			return 御灵界面.to神兽界面()
		end
		
		if 操作.识别2(标识.神兽界面) then
			keepScreen(false)
			return 神兽界面.to战斗准备界面()
		end	
		
		if 操作.识别2(标识.战斗准备界面) then
			keepScreen(false)
			return 战斗准备界面.to战斗界面()
		end
		
		if 操作.识别2(标识.战斗界面) then
			keepScreen(false)
			return 战斗界面.to战斗胜利界面()
		end
		
		if 操作.或识别({标识.公告界面,标识.登录界面1},false) then
			keepScreen(false)
			执行任务.设置登录游戏流程()
			return 执行任务.登录游戏()
		end
		
		if 操作.或识别({标识.战斗胜利界面1,标识.战斗胜利界面2,标识.战斗胜利界面3},false) then
			keepScreen(false)
			return 战斗胜利界面.to战斗结算界面2()
		end
		
		if 操作.识别2(标识.战斗失败界面) then
			keepScreen(false)
			return 战斗失败界面.to神兽界面()
		end
		
		if 操作.识别2(标识.战斗结算界面1) then
			keepScreen(false)
			return 战斗结算界面1.to战斗结算界面2()
		end
		
		if 操作.识别2(标识.战斗结算界面2) then
			keepScreen(false)
			return 战斗结算界面2.to神兽界面()
		end
		
		if 操作.识别2(标识.战斗结算界面3) then
			keepScreen(false)
			return 战斗结算界面3.to神兽界面()
		end
		
		if 操作.识别2(标识.个人突破界面) then
			keepScreen(false)
			操作.点击按钮(按钮.个人突破界面_退出按钮)
			mSleep(888)
			return 探索界面.to御灵界面()
		end
		
		if 操作.识别2(标识.寮突破界面) then
			keepScreen(false)
			操作.点击按钮(按钮.寮突破界面_退出按钮)
			mSleep(888)
			return 探索界面.to御灵界面()
		end
		
		if 操作.识别2(标识.购买体力界面) then
			keepScreen(false)
			return 购买体力界面.操作()
		end
		
		if 操作.识别2(标识.探索准备界面) then
			keepScreen(false)
			return 探索准备界面.to探索界面()
		end
		
		if 操作.识别2(标识.邮箱界面) then
			keepScreen(false)
			操作.点击按钮(按钮.邮箱界面_关闭)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.寮公告界面) then
			keepScreen(false)
			操作.点击按钮(按钮.寮公告界面_确定)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.召唤界面) then
			keepScreen(false)
			操作.点击按钮(按钮.召唤界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.结界界面) then
			keepScreen(false)
			操作.点击按钮(按钮.结界界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end	
		
		if 操作.识别2(标识.寄养界面) then
			keepScreen(false)
			寄养界面.退出()
		end
		
		if 操作.识别2(标识.buff界面) then
			keepScreen(false)
			操作.点击按钮(按钮.buff界面_退出区域)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.重连) then
			keepScreen(false)
			执行任务.等待重连()
		end
		
		if 操作.识别2(标识.登录动画界面) then
			keepScreen(false)
			mSleep(3000)
			if 操作.识别2(标识.登录动画界面) then
				执行任务.设置登录游戏流程()
				return 执行任务.登录游戏()
			end
		end
		
		if 参数.禁止聊天 then
			if 操作.识别点击(按钮.频道界面_关闭按钮,true) then
				keepScreen(false)
				mSleep(888)
				return 执行任务.重新识别()
			end
		
			if 操作.识别2(标识.聊天界面) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭按钮)
				mSleep(888)
				return 执行任务.重新识别()
			end
			
			if 操作.识别2(标识.聊天界面_好友信息) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭好友信息)
				mSleep(888)
				return 执行任务.重新识别()
			end
		end
		
		if 操作.识别点击(按钮.式神录界面_返回按钮,true) then
			keepScreen(false)
			mSleep(2000)
			return 执行任务.重新识别()
		end
		
		if 操作.或识别({标识.离岛界面,标识.离岛界面2},false) then
			keepScreen(false)
			操作.点击按钮(按钮.离岛界面_返回)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.道场（居酒屋）界面) then
			keepScreen(false)
			操作.点击按钮(按钮.道场（居酒屋）界面_关闭)
			mSleep(666)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.浮世澡堂界面) then
			keepScreen(false)
			操作.点击按钮(按钮.浮世澡堂界面_关闭)
			mSleep(666)
			return 执行任务.重新识别()
		end
		
		keepScreen(false)
		执行任务.检查闪退()
		mSleep(1000)
	end
end
----

------------妖气------------
function 执行任务.妖气()
	sysLog('重新识别界面中......')
	while true do
		keepScreen(true)
		
		if 操作.识别2(标识.协作界面) then
			keepScreen(false)
			return 协作任务界面.处理()
		end
		
		if 操作.识别2(标识.超鬼王界面) then
			keepScreen(false)
			if 参数.交叉超鬼王 then
				return 执行任务.切换超鬼王()
			else
				操作.点击按钮(按钮.超鬼王界面_退出按钮)
				mSleep(300)
				return 探索界面.to庭院界面()
			end
		end
		
		if 操作.或识别({标识.庭院界面1,标识.庭院界面2},false) then
			keepScreen(false)
			return 庭院界面.to组队界面()
		end
		
		if 操作.识别2(标识.组队界面) then
			keepScreen(false)
			return 组队界面.to房间界面()
		end
		
		if 操作.识别2(标识.房间界面) then
			keepScreen(false)
			return 房间界面.to战斗准备界面（队员）()
		end
		
		if 操作.识别2(标识.战斗准备界面) then
			keepScreen(false)
			return 战斗准备界面.to战斗界面()
		end
		
		if 操作.识别2(标识.战斗界面) then
			keepScreen(false)
			return 战斗界面.to战斗胜利界面()
		end
		
		if 操作.或识别({标识.公告界面,标识.登录界面1},false) then
			keepScreen(false)
			执行任务.设置登录游戏流程()
			return 执行任务.登录游戏()
		end
		
		if 操作.或识别({标识.战斗胜利界面1,标识.战斗胜利界面2,标识.战斗胜利界面3},false) then
			keepScreen(false)
			return 战斗胜利界面.to战斗结算界面2()
		end
		
		if 操作.识别2(标识.战斗失败界面) then
			keepScreen(false)
			return 战斗失败界面.to庭院界面()
		end
		
		if 操作.识别2(标识.战斗结算界面1) then
			keepScreen(false)
			return 战斗结算界面1.to战斗结算界面2()
		end
		
		if 操作.识别2(标识.战斗结算界面2) then
			keepScreen(false)
			return 战斗结算界面2.to庭院界面()
		end
		
		if 操作.识别2(标识.战斗结算界面3) then
			keepScreen(false)
			return 战斗结算界面3.to庭院界面()
		end
		
		if 操作.识别2(标识.探索界面) then
			keepScreen(false)
			return 探索界面.to庭院界面()
		end
		
		if 操作.识别2(标识.个人突破界面) then
			keepScreen(false)
			操作.点击按钮(按钮.个人突破界面_退出按钮)
			mSleep(888)
			return 探索界面.to庭院界面()
		end
		
		if 操作.识别2(标识.寮突破界面) then
			keepScreen(false)
			操作.点击按钮(按钮.寮突破界面_退出按钮)
			mSleep(888)
			return 探索界面.to庭院界面()
		end
		
		if 操作.识别2(标识.购买体力界面) then
			keepScreen(false)
			return 购买体力界面.操作()
		end
		
		if 操作.识别2(标识.探索准备界面) then
			keepScreen(false)
			return 探索准备界面.to探索界面()
		end
		
		if 操作.识别2(标识.邮箱界面) then
			keepScreen(false)
			操作.点击按钮(按钮.邮箱界面_关闭)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.寮公告界面) then
			keepScreen(false)
			操作.点击按钮(按钮.寮公告界面_确定)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.召唤界面) then
			keepScreen(false)
			操作.点击按钮(按钮.召唤界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.结界界面) then
			keepScreen(false)
			操作.点击按钮(按钮.结界界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end	
		
		if 操作.识别2(标识.寄养界面) then
			keepScreen(false)
			寄养界面.退出()
		end
		
		if 操作.识别2(标识.buff界面) then
			keepScreen(false)
			操作.点击按钮(按钮.buff界面_退出区域)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.重连) then
			keepScreen(false)
			执行任务.等待重连()
		end
		
		if 操作.识别2(标识.登录动画界面) then
			keepScreen(false)
			mSleep(3000)
			if 操作.识别2(标识.登录动画界面) then
				执行任务.设置登录游戏流程()
				return 执行任务.登录游戏()
			end
		end
		
		if 参数.禁止聊天 then
			if 操作.识别点击(按钮.频道界面_关闭按钮,true) then
				keepScreen(false)
				mSleep(888)
				return 执行任务.重新识别()
			end
		
			if 操作.识别2(标识.聊天界面) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭按钮)
				mSleep(888)
				return 执行任务.重新识别()
			end
			
			if 操作.识别2(标识.聊天界面_好友信息) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭好友信息)
				mSleep(888)
				return 执行任务.重新识别()
			end
		end
		
		if 操作.识别点击(按钮.式神录界面_返回按钮,true) then
			keepScreen(false)
			mSleep(2000)
			return 执行任务.重新识别()
		end
		
		if 操作.或识别({标识.离岛界面,标识.离岛界面2},false) then
			keepScreen(false)
			操作.点击按钮(按钮.离岛界面_返回)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.道场（居酒屋）界面) then
			keepScreen(false)
			操作.点击按钮(按钮.道场（居酒屋）界面_关闭)
			mSleep(666)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.浮世澡堂界面) then
			keepScreen(false)
			操作.点击按钮(按钮.浮世澡堂界面_关闭)
			mSleep(666)
			return 执行任务.重新识别()
		end
		
		keepScreen(false)
		执行任务.检查闪退()
		mSleep(1000)
	end
end
----

------------死神------------
function 执行任务.死神()
	sysLog('重新识别界面中......')
	while true do
		keepScreen(true)
		
		if 操作.识别2(标识.协作界面) then
			keepScreen(false)
			return 协作任务界面.处理()
		end
		
		if 操作.识别2(标识.超鬼王界面) then
			keepScreen(false)
			if 参数.交叉超鬼王 then
				return 执行任务.切换超鬼王()
			else
				操作.点击按钮(按钮.超鬼王界面_退出按钮)
				mSleep(300)
				return 探索界面.to庭院界面()
			end
		end
		
		if 操作.或识别({标识.庭院界面1,标识.庭院界面2},false) then
			keepScreen(false)
			return 庭院界面.to组队界面()
		end
		
		if 操作.识别2(标识.组队界面) then
			keepScreen(false)
			if 参数.自己发现的死神 then
				return 组队界面.后退()
			else
				return 组队界面.to房间界面2()
			end
		end
		
		if 操作.识别2(标识.房间界面) then
			keepScreen(false)
			return 房间界面.to战斗准备界面（队员）()
		end
		
		if 操作.识别2(标识.战斗准备界面) then
			keepScreen(false)
			return 战斗准备界面.to战斗界面()
		end
		
		if 操作.识别2(标识.战斗界面) then
			keepScreen(false)
			return 战斗界面.to战斗胜利界面()
		end
		
		if 操作.或识别({标识.战斗胜利界面1,标识.战斗胜利界面2,标识.战斗胜利界面3},false) then
			keepScreen(false)
			return 战斗胜利界面.to战斗结算界面2()
		end
		
		if 操作.识别2(标识.战斗失败界面) then
			keepScreen(false)
			return 战斗失败界面.to庭院界面()
		end
		
		if 操作.识别2(标识.战斗结算界面1) then
			keepScreen(false)
			return 战斗结算界面1.to战斗结算界面2()
		end
		
		if 操作.识别2(标识.战斗结算界面2) then
			keepScreen(false)
			return 战斗结算界面2.to庭院界面()
		end
		
		if 操作.识别2(标识.战斗结算界面3) then
			keepScreen(false)
			return 战斗结算界面3.to庭院界面()
		end
		
		if 操作.识别2(标识.探索界面) then
			keepScreen(false)
			if 参数.自己发现的死神 then 
				return 探索界面.切换主任务()
			else
				return 探索界面.to庭院界面()
			end
		end
		
		if 操作.识别2(标识.个人突破界面) then
			keepScreen(false)
			操作.点击按钮(按钮.个人突破界面_退出按钮)
			mSleep(888)
			return 探索界面.to庭院界面()
		end
		
		if 操作.识别2(标识.寮突破界面) then
			keepScreen(false)
			操作.点击按钮(按钮.寮突破界面_退出按钮)
			mSleep(888)
			return 探索界面.to庭院界面()
		end
		
		if 操作.识别2(标识.购买体力界面) then
			keepScreen(false)
			return 购买体力界面.操作()
		end
		
		if 操作.识别2(标识.探索准备界面) then
			keepScreen(false)
			return 探索准备界面.to探索界面()
		end
		
		if 参数.交叉死神 then
			if 操作.识别2(标识.创建队伍界面) then
				keepScreen(false)
				return 创建队伍界面.to组队界面()
			end
			
			if 操作.识别2(标识.组队界面) then
				keepScreen(false)
				if 参数.任务=='大蛇' then
					return 组队界面.to大蛇界面()
				elseif 参数.任务=='觉醒' then
					return 组队界面.to麒麟界面()
				else
					return 组队界面.to庭院界面()
				end
			end
			
			if 操作.识别2(标识.鬼王界面) then
				keepScreen(false)
				return 鬼王界面.to鬼王创建队伍界面()
			end
			
			if 操作.识别2(标识.鬼王创建队伍界面) then
				keepScreen(false)
				return 鬼王创建队伍界面.to房间界面()
			end
			
			if 操作.识别2(标识.大蛇界面) then
				keepScreen(false)
				return 大蛇界面.to探索界面()
			end
			
			if 操作.或识别({标识.麒麟界面1,标识.麒麟界面2},false) then
				keepScreen(false)
				return 麒麟界面.to探索界面()
			end
			
			if 操作.识别2(标识.业原火界面) then
				keepScreen(false)
				return 业原火界面.to探索界面()
			end	
			
			if 操作.识别2(标识.神兽界面) then
				keepScreen(false)
				return 神兽界面.to探索界面()
			end
			
		end
		
		if 操作.识别2(标识.邮箱界面) then
			keepScreen(false)
			操作.点击按钮(按钮.邮箱界面_关闭)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.寮公告界面) then
			keepScreen(false)
			操作.点击按钮(按钮.寮公告界面_确定)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.召唤界面) then
			keepScreen(false)
			操作.点击按钮(按钮.召唤界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.结界界面) then
			keepScreen(false)
			操作.点击按钮(按钮.结界界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end	
		
		if 操作.识别2(标识.寄养界面) then
			keepScreen(false)
			寄养界面.退出()
		end
		
		if 操作.识别2(标识.buff界面) then
			keepScreen(false)
			操作.点击按钮(按钮.buff界面_退出区域)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.重连) then
			keepScreen(false)
			执行任务.等待重连()
		end
		
		if 操作.或识别({标识.公告界面,标识.登录界面1},false) then
			keepScreen(false)
			执行任务.设置登录游戏流程()
			return 执行任务.登录游戏()
		end
		
		if 操作.识别2(标识.登录动画界面) then
			keepScreen(false)
			mSleep(3000)
			if 操作.识别2(标识.登录动画界面) then
				执行任务.设置登录游戏流程()
				return 执行任务.登录游戏()
			end
		end
		
		if 参数.禁止聊天 then
			if 操作.识别点击(按钮.频道界面_关闭按钮,true) then
				keepScreen(false)
				mSleep(888)
				return 执行任务.重新识别()
			end
		
			if 操作.识别2(标识.聊天界面) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭按钮)
				mSleep(888)
				return 执行任务.重新识别()
			end
			
			if 操作.识别2(标识.聊天界面_好友信息) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭好友信息)
				mSleep(888)
				return 执行任务.重新识别()
			end
		end
		
		if 操作.识别点击(按钮.式神录界面_返回按钮,true) then
			keepScreen(false)
			mSleep(2000)
			return 执行任务.重新识别()
		end
		
		keepScreen(false)
		执行任务.检查闪退()
		mSleep(1000)
	end
end
----

------------年兽-------------
function 执行任务.年兽()
	sysLog('重新识别界面中......')
	while true do
		keepScreen(true)
		
		if 操作.识别2(标识.协作界面) then
			keepScreen(false)
			return 协作任务界面.处理()
		end
		
		if 操作.识别2(标识.超鬼王界面) then
			keepScreen(false)
			if 参数.交叉超鬼王 then
				return 执行任务.切换超鬼王()
			else
				操作.点击按钮(按钮.超鬼王界面_退出按钮)
				mSleep(300)
				return 探索界面.to庭院界面()
			end
		end
		
		if 操作.或识别({标识.庭院界面1,标识.庭院界面2},false) then
			keepScreen(false)
			return 庭院界面.to组队界面()
		end
		
		if 操作.识别2(标识.组队界面) then
			keepScreen(false)
			if 参数.自己发现的年兽 then
				return 组队界面.后退()
			else
				return 组队界面.to房间界面2()
			end
		end
		
		if 操作.识别2(标识.房间界面) then
			keepScreen(false)
			return 房间界面.to战斗准备界面（队员）()
		end
		
		if 操作.识别2(标识.战斗准备界面) then
			keepScreen(false)
			return 战斗准备界面.to战斗界面()
		end
		
		if 操作.识别2(标识.战斗界面) then
			keepScreen(false)
			return 战斗界面.to战斗胜利界面()
		end
		
		if 操作.或识别({标识.公告界面,标识.登录界面1},false) then
			keepScreen(false)
			执行任务.设置登录游戏流程()
			return 执行任务.登录游戏()
		end
		
		if 操作.或识别({标识.战斗胜利界面1,标识.战斗胜利界面2,标识.战斗胜利界面3},false) then
			keepScreen(false)
			return 战斗胜利界面.to战斗结算界面2()
		end
		
		if 操作.识别2(标识.战斗失败界面) then
			keepScreen(false)
			return 战斗失败界面.to庭院界面()
		end
		
		if 操作.识别2(标识.战斗结算界面1) then
			keepScreen(false)
			return 战斗结算界面1.to战斗结算界面2()
		end
		
		if 操作.识别2(标识.战斗结算界面2) then
			keepScreen(false)
			return 战斗结算界面2.to庭院界面()
		end
		
		if 操作.识别2(标识.战斗结算界面3) then
			keepScreen(false)
			return 战斗结算界面3.to庭院界面()
		end
		
		if 操作.识别2(标识.探索界面) then
			keepScreen(false)
			if 参数.自己发现的年兽 then 
				return 探索界面.切换主任务()
			else
				return 探索界面.to庭院界面()
			end
		end
		
		if 操作.识别2(标识.个人突破界面) then
			keepScreen(false)
			操作.点击按钮(按钮.个人突破界面_退出按钮)
			mSleep(888)
			return 探索界面.to庭院界面()
		end
		
		if 操作.识别2(标识.寮突破界面) then
			keepScreen(false)
			操作.点击按钮(按钮.寮突破界面_退出按钮)
			mSleep(888)
			return 探索界面.to庭院界面()
		end
		
		if 操作.识别2(标识.购买体力界面) then
			keepScreen(false)
			return 购买体力界面.操作()
		end
		
		if 操作.识别2(标识.探索准备界面) then
			keepScreen(false)
			return 探索准备界面.to探索界面()
		end
		
		if 参数.交叉年兽 then
			if 操作.识别2(标识.创建队伍界面) then
				keepScreen(false)
				return 创建队伍界面.to组队界面()
			end
			
			if 操作.识别2(标识.组队界面) then
				keepScreen(false)
				if 参数.任务=='大蛇' then
					return 组队界面.to大蛇界面()
				elseif 参数.任务=='觉醒' then
					return 组队界面.to麒麟界面()
				else
					return 组队界面.to庭院界面()
				end
			end
			
			if 操作.识别2(标识.年兽界面) then
				keepScreen(false)
				return 年兽界面.to鬼王创建队伍界面()
			end
			
			if 操作.识别2(标识.鬼王创建队伍界面) then
				keepScreen(false)
				return 鬼王创建队伍界面.to房间界面()
			end
			
			if 操作.识别2(标识.大蛇界面) then
				keepScreen(false)
				return 大蛇界面.to探索界面()
			end
			
			if 操作.或识别({标识.麒麟界面1,标识.麒麟界面2},false) then
				keepScreen(false)
				return 麒麟界面.to探索界面()
			end
			
			if 操作.识别2(标识.业原火界面) then
				keepScreen(false)
				return 业原火界面.to探索界面()
			end	
			
			if 操作.识别2(标识.神兽界面) then
				keepScreen(false)
				return 神兽界面.to探索界面()
			end
			
			if 操作.识别2(标识.大江山之战界面) then
				keepScreen(false)
				return 大江山之战界面.to庭院界面()
			end
			
			if 操作.识别2(标识.修罗战场界面) then
				keepScreen(false)
				return 修罗战场界面.to大江山之战界面()
			end
			
			if 操作.识别2(标识.海国退治界面) then
				keepScreen(false)
				return 海国退治界面.to大江山之战界面()
			end
			
		end
		
		if 操作.识别2(标识.召唤界面) then
			keepScreen(false)
			操作.点击按钮(按钮.召唤界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.结界界面) then
			keepScreen(false)
			操作.点击按钮(按钮.结界界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end	
		
		if 操作.识别2(标识.寄养界面) then
			keepScreen(false)
			寄养界面.退出()
		end
		
		if 操作.识别2(标识.buff界面) then
			keepScreen(false)
			操作.点击按钮(按钮.buff界面_退出区域)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.重连) then
			keepScreen(false)
			执行任务.等待重连()
		end
		
		if 操作.识别2(标识.登录动画界面) then
			keepScreen(false)
			mSleep(3000)
			if 操作.识别2(标识.登录动画界面) then
				执行任务.设置登录游戏流程()
				return 执行任务.登录游戏()
			end
		end
		
		if 参数.禁止聊天 then
			if 操作.识别点击(按钮.频道界面_关闭按钮,true) then
				keepScreen(false)
				mSleep(888)
				return 执行任务.重新识别()
			end
		
			if 操作.识别2(标识.聊天界面) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭按钮)
				mSleep(888)
				return 执行任务.重新识别()
			end
			
			if 操作.识别2(标识.聊天界面_好友信息) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭好友信息)
				mSleep(888)
				return 执行任务.重新识别()
			end
		end
		
		if 操作.识别点击(按钮.式神录界面_返回按钮,true) then
			keepScreen(false)
			mSleep(2000)
			return 执行任务.重新识别()
		end
		
		if 操作.或识别({标识.离岛界面,标识.离岛界面2},false) then
			keepScreen(false)
			操作.点击按钮(按钮.离岛界面_返回)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.道场（居酒屋）界面) then
			keepScreen(false)
			操作.点击按钮(按钮.道场（居酒屋）界面_关闭)
			mSleep(666)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.浮世澡堂界面) then
			keepScreen(false)
			操作.点击按钮(按钮.浮世澡堂界面_关闭)
			mSleep(666)
			return 执行任务.重新识别()
		end
		
		keepScreen(false)
		执行任务.检查闪退()
		mSleep(1000)
	end
end
----

------------超鬼王------------
function 执行任务.超鬼王（主）()
	while true do
		sysLog('等待超鬼王邀请...')
		--等待邀请
		for i=1,12 do 
			执行任务.识别超鬼王()
			keepScreen(true)
			
			if 操作.识别2(标识.协作界面) then
				keepScreen(false)
				return 协作任务界面.处理()
			end
			
			if 操作.或识别({标识.庭院界面1,标识.庭院界面2},false) then
				keepScreen(false)
				return 庭院界面.to超鬼王界面()
			end
			
			if 操作.识别2(标识.超鬼王界面) then
				keepScreen(false)
				return 执行任务.切换超鬼王()
			end
			
			if 操作.识别2(标识.重连) then
				keepScreen(false)
				参数.等待邀请次数=0
				执行任务.等待重连()
			end
			
			if 操作.或识别({标识.公告界面,标识.登录界面1},false) then
				keepScreen(false)
				参数.等待邀请次数=0
				执行任务.设置登录游戏流程()
				return 执行任务.登录游戏()
			end
			
			if 操作.识别2(标识.登录动画界面) then
				keepScreen(false)
				参数.等待邀请次数=0
				mSleep(3000)
				if 操作.识别2(标识.登录动画界面) then
					执行任务.设置登录游戏流程()
					return 执行任务.登录游戏()
				end
			end
			
			if 参数.禁止聊天 then
				if 操作.识别点击(按钮.频道界面_关闭按钮,true) then
					keepScreen(false)
					mSleep(888)
					return 执行任务.重新识别()
				end
			
				if 操作.识别2(标识.聊天界面) then
					keepScreen(false)
					操作.点击按钮(按钮.聊天界面_关闭按钮)
					mSleep(888)
					return 执行任务.重新识别()
				end
				
				if 操作.识别2(标识.聊天界面_好友信息) then
					keepScreen(false)
					操作.点击按钮(按钮.聊天界面_关闭好友信息)
					mSleep(888)
					return 执行任务.重新识别()
				end
			end
			
			if 操作.识别点击(按钮.式神录界面_返回按钮,true) then
				keepScreen(false)
				mSleep(2000)
				return 执行任务.重新识别()
			end
			
			if 操作.识别2(标识.召唤界面) then
				keepScreen(false)
				操作.点击按钮(按钮.召唤界面_返回)
				mSleep(3000)
				return 执行任务.重新识别()
			end
			
			if 操作.识别2(标识.结界界面) then
				keepScreen(false)
				操作.点击按钮(按钮.结界界面_返回)
				mSleep(3000)
				return 执行任务.重新识别()
			end	
			
			if 操作.识别2(标识.寄养界面) then
				keepScreen(false)
				操作.点击按钮(按钮.寄养界面_返回)
				mSleep(1000)
				return 执行任务.重新识别()
			end
			
			if 操作.识别2(标识.寮公告界面) then
				keepScreen(false)
				操作.点击按钮(按钮.寮公告界面_确定)
				mSleep(1000)
				return 执行任务.重新识别()
			end
			
			if 操作.识别2(标识.buff界面) then
				keepScreen(false)
				操作.点击按钮(按钮.buff界面_退出区域)
				mSleep(1000)
				return 执行任务.重新识别()
			end
			
			keepScreen(false)
			执行任务.检查闪退()
			mSleep(5000)
		end
		--主动检查
		if 操作.识别2(标识.探索界面) then
			if 参数.交叉离岛 or 参数.交叉寮突破 or 参数.交叉个人突破 or 参数.交叉超鬼王 or 参数.交叉死神 then
				探索界面.切换副任务()
			end
			return 探索界面.to超鬼王界面()
		end
	end
end

function 执行任务.超鬼王()
	sysLog('重新识别界面中......')
	while true do
		keepScreen(true)
		
		if 操作.识别2(标识.协作界面) then
			keepScreen(false)
			return 协作任务界面.处理()
		end
		
		if 操作.识别2(标识.探索界面) then
			keepScreen(false)
			return 探索界面.to超鬼王界面()
		end
		
		if 操作.识别2(标识.超鬼王界面) then
			keepScreen(false)
			if 参数.智能开关buff and 参数.调整开关buff~='保持' then
				操作.点击按钮(按钮.超鬼王界面_退出按钮)
				mSleep(666)
				return 执行任务.重新识别()
			end
			return 超鬼王界面.to战斗准备界面()
		end
		
		if 操作.识别2(标识.战斗准备界面) then
			keepScreen(false)
			return 战斗准备界面.to战斗界面()
		end
		
		if 操作.识别2(标识.战斗界面) then
			keepScreen(false)
			return 战斗界面.to战斗胜利界面()
		end
		
		if 操作.或识别({标识.战斗胜利界面1,标识.战斗胜利界面2,标识.战斗胜利界面3},false) then
			keepScreen(false)
			return 战斗胜利界面.to超鬼王界面()
		end
		
		if 操作.识别2(标识.战斗失败界面) then
			keepScreen(false)
			return 战斗失败界面.to超鬼王界面()
		end		
		
		if 操作.或识别({标识.庭院界面1,标识.庭院界面2},false) then
			keepScreen(false)
			return 庭院界面.to超鬼王界面()
		end
		
		if 操作.识别2(标识.重邀界面) then
			操作.点击按钮(按钮.重邀界面_取消按钮)
			mSleep(666)
			return 探索界面.to超鬼王界面()
		end
		
		if 操作.识别2(标识.探索准备界面) then
			keepScreen(false)
			操作.点击按钮(按钮.探索准备界面_关闭按钮)
			mSleep(300)
			return 探索界面.to超鬼王界面()
		end
		
		if 操作.识别2(标识.个人突破界面) then
			keepScreen(false)
			操作.点击按钮(按钮.个人突破界面_退出按钮)
			mSleep(888)
			return 探索界面.to超鬼王界面()
		end
		
		if 操作.识别2(标识.寮突破界面) then
			keepScreen(false)
			操作.点击按钮(按钮.寮突破界面_退出按钮)
			mSleep(888)
			return 探索界面.to超鬼王界面()
		end
		
		if 操作.识别2(标识.大蛇界面) then
			keepScreen(false)
			操作.点击按钮(按钮.大蛇界面_关闭按钮)
			mSleep(888)
			return 探索界面.to超鬼王界面()
		end
		
		if 操作.或识别({标识.麒麟界面1,标识.麒麟界面2},false) then
			keepScreen(false)
			操作.点击按钮(按钮.麒麟界面_关闭按钮)
			mSleep(888)
			return 探索界面.to超鬼王界面()
		end
		
		if 操作.识别2(标识.创建队伍界面) then
			keepScreen(false)
			操作.点击按钮(按钮.创建队伍界面_取消按钮)
			mSleep(300*参数.延时倍数)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.超鬼王邀请界面) then
			keepScreen(false)
			if (鬼王星级==6) then
				超鬼王邀请界面.邀请(参数.六星超鬼王邀请目标)
			end
			if (鬼王星级==5) then
				超鬼王邀请界面.邀请(参数.五星超鬼王邀请目标)
			end
			if (鬼王星级==4) then
				超鬼王邀请界面.邀请(参数.四星超鬼王邀请目标)
			end
			if (鬼王星级==3) then
				超鬼王邀请界面.邀请(参数.三星超鬼王邀请目标)
			end
			if (鬼王星级==2) then
				超鬼王邀请界面.邀请(参数.二星超鬼王邀请目标)
			end
			if (鬼王星级==1) then
				超鬼王邀请界面.邀请(参数.一星超鬼王邀请目标)
			else
				操作.点击按钮(按钮.超鬼王邀请界面_邀请按钮)
			end
			
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.召唤界面) then
			keepScreen(false)
			操作.点击按钮(按钮.召唤界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.结界界面) then
			keepScreen(false)
			操作.点击按钮(按钮.结界界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end	
		
		if 操作.识别2(标识.寮公告界面) then
			keepScreen(false)
			操作.点击按钮(按钮.寮公告界面_确定)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.寄养界面) then
			keepScreen(false)
			寄养界面.退出()
		end
		
		if 操作.识别2(标识.buff界面) then
			keepScreen(false)
			操作.点击按钮(按钮.buff界面_退出区域)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		--[[
		if 操作.识别2(标识.重连) then
			keepScreen(false)
			执行任务.等待重连()
		end
		
		if 操作.或识别({标识.公告界面,标识.登录界面1},false) then
			keepScreen(false)
			执行任务.设置登录游戏流程()
			return 执行任务.登录游戏()
		end
		
		if 操作.识别2(标识.登录动画界面) then
			keepScreen(false)
			mSleep(3000)
			if 操作.识别2(标识.登录动画界面) then
				执行任务.设置登录游戏流程()
				return 执行任务.登录游戏()
			end
		end
		--]]
		if 操作.识别2(标识.聊天界面) then
			keepScreen(false)
			操作.点击按钮(按钮.聊天界面_关闭按钮)
			mSleep(888)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.聊天界面_好友信息) then
			keepScreen(false)
			操作.点击按钮(按钮.聊天界面_关闭好友信息)
			mSleep(888)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(按钮.式神录界面_返回按钮) then
			操作.点击按钮(按钮.直播界面_返回按钮)
			keepScreen(false)
			mSleep(2000)
			return 执行任务.重新识别()
		end
		
		keepScreen(false)
		执行任务.检查闪退()
		mSleep(1000)
	end
end
----

-----------修罗战场------------
function 执行任务.修罗战场()
	sysLog('重新识别界面中......')
	while true do
		keepScreen(true)
		
		if 操作.识别2(标识.协作界面) then
			keepScreen(false)
			return 协作任务界面.处理()
		end
		
		if 操作.识别2(标识.超鬼王界面) then
			keepScreen(false)
			if 参数.交叉超鬼王 then
				return 执行任务.切换超鬼王()
			else
				操作.点击按钮(按钮.超鬼王界面_退出按钮)
				mSleep(300)
				return 探索界面.to御魂界面()
			end
		end
		
		if 操作.或识别({标识.庭院界面1,标识.庭院界面2},false) then
			keepScreen(false)
			return 庭院界面.to大江山之战界面()
		end
		
		if 操作.识别2(标识.探索界面) then
			keepScreen(false)
			if 参数.智能开关buff and 参数.调整开关buff~='保持' then
				探索界面.开关buff()
			end
			return 探索界面.to庭院界面()
		end
		
		if 操作.识别2(标识.大江山之战界面) then
			keepScreen(false)
			return 大江山之战界面.to修罗战场界面()
		end
		
		if 操作.识别2(标识.修罗战场界面) then
			keepScreen(false)
			return 修罗战场界面.to战斗准备界面()
		end
		
		if 操作.识别2(标识.战斗准备界面) then
			keepScreen(false)
			return 战斗准备界面.to战斗界面()
		end
		
		if 操作.识别2(标识.寄养界面) then
			keepScreen(false)
			寄养界面.退出()
		end
		
		if 操作.识别2(标识.战斗界面) then
			keepScreen(false)
			return 战斗界面.to战斗胜利界面()
		end
		
		if 操作.或识别({标识.公告界面,标识.登录界面1},false) then
			keepScreen(false)
			执行任务.设置登录游戏流程()
			return 执行任务.登录游戏()
		end
		
		if 操作.或识别({标识.战斗胜利界面1,标识.战斗胜利界面2,标识.战斗胜利界面3},false) then
			keepScreen(false)
			return 战斗胜利界面.to战斗结算界面2()
		end
		
		if 操作.识别2(标识.战斗失败界面) then
			keepScreen(false)
			return 战斗失败界面.to修罗战场界面()
		end
		
		if 操作.识别2(标识.战斗结算界面1) then
			keepScreen(false)
			return 战斗结算界面1.to战斗结算界面2()
		end
		
		if 操作.识别2(标识.战斗结算界面2) then
			keepScreen(false)
			return 战斗结算界面2.to修罗战场界面()	
		end
		
		if 操作.识别2(标识.战斗结算界面2_御魂超出上限) then
			keepScreen(false)
			参数.御魂超出上限=true
			操作.点击按钮(按钮.战斗结算界面2_御魂超出上限确定按钮)
			mSleep(666)
			return 战斗结算界面2.to修罗战场界面()
		end
		
		if 操作.识别2(标识.战斗结算界面3) then
			keepScreen(false)
			return 战斗结算界面3.to修罗战场界面()
		end
		
		if 操作.识别2(标识.大江山宝库界面) then
			keepScreen(false)
			return 大江山宝库界面.to大江山之战界面()
		end
		
		if 操作.识别2(标识.源氏藏兵阁界面) then
			keepScreen(false)
			return 源氏藏兵阁界面.to大江山之战界面()
		end
		
		if 操作.识别2(标识.个人突破界面) then
			keepScreen(false)
			操作.点击按钮(按钮.个人突破界面_退出按钮)
			mSleep(888)
			return 探索界面.to庭院界面()
		end
		
		if 操作.识别2(标识.寮突破界面) then
			keepScreen(false)
			操作.点击按钮(按钮.寮突破界面_退出按钮)
			mSleep(888)
			return 探索界面.to庭院界面()
		end
		
		if 操作.识别2(标识.真蛇界面) then
			keepScreen(false)
			return 真蛇界面.to探索界面()
		end
		
		if 操作.识别2(标识.购买体力界面) then
			keepScreen(false)
			return 购买体力界面.操作()
		end
		
		if 操作.识别2(标识.邮箱界面) then
			keepScreen(false)
			操作.点击按钮(按钮.邮箱界面_关闭)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.寮公告界面) then
			keepScreen(false)
			操作.点击按钮(按钮.寮公告界面_确定)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.召唤界面) then
			keepScreen(false)
			操作.点击按钮(按钮.召唤界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.结界界面) then
			keepScreen(false)
			操作.点击按钮(按钮.结界界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end	
		
		if 操作.识别2(标识.buff界面) then
			keepScreen(false)
			操作.点击按钮(按钮.buff界面_退出区域)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.重连) then
			keepScreen(false)
			执行任务.等待重连()
		end
		
		if 操作.识别2(标识.登录动画界面) then
			keepScreen(false)
			mSleep(3000)
			if 操作.识别2(标识.登录动画界面) then
				执行任务.设置登录游戏流程()
				return 执行任务.登录游戏()
			end
		end
		
		if 参数.禁止聊天 then
			if 操作.识别点击(按钮.频道界面_关闭按钮,true) then
				keepScreen(false)
				mSleep(888)
				return 执行任务.重新识别()
			end
		
			if 操作.识别2(标识.聊天界面) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭按钮)
				mSleep(888)
				return 执行任务.重新识别()
			end
			
			if 操作.识别2(标识.聊天界面_好友信息) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭好友信息)
				mSleep(888)
				return 执行任务.重新识别()
			end
		end
		
		if 操作.识别点击(按钮.式神录界面_返回按钮,true) then
			keepScreen(false)
			mSleep(2000)
			return 执行任务.重新识别()
		end
		
		keepScreen(false)
		执行任务.检查闪退()
		mSleep(1000)
	end
	
	
end


-----------海国退治------------
function 执行任务.海国退治()
	sysLog('重新识别界面中......')
	while true do
		keepScreen(true)
		
		if 操作.识别2(标识.协作界面) then
			keepScreen(false)
			return 协作任务界面.处理()
		end
		
		if 操作.识别2(标识.超鬼王界面) then
			keepScreen(false)
			if 参数.交叉超鬼王 then
				return 执行任务.切换超鬼王()
			else
				操作.点击按钮(按钮.超鬼王界面_退出按钮)
				mSleep(300)
				return 探索界面.to御魂界面()
			end
		end
		
		if 操作.或识别({标识.庭院界面1,标识.庭院界面2},false) then
			keepScreen(false)
			return 庭院界面.to大江山之战界面()
		end
		
		if 操作.识别2(标识.探索界面) then
			keepScreen(false)
			if 参数.智能开关buff and 参数.调整开关buff~='保持' then
				探索界面.开关buff()
			end
			return 探索界面.to庭院界面()
		end
		
		if 操作.识别2(标识.大江山之战界面) then
			keepScreen(false)
			return 大江山之战界面.to海国退治界面()
		end
		
		if 操作.识别2(标识.海国退治界面) then
			keepScreen(false)
			return 海国退治界面.to战斗准备界面()
		end
		
		if 操作.识别2(标识.战斗准备界面) then
			keepScreen(false)
			return 战斗准备界面.to战斗界面()
		end
		
		if 操作.识别2(标识.寄养界面) then
			keepScreen(false)
			寄养界面.退出()
		end
		
		if 操作.识别2(标识.战斗界面) then
			keepScreen(false)
			return 战斗界面.to战斗胜利界面()
		end
		
		if 操作.或识别({标识.公告界面,标识.登录界面1},false) then
			keepScreen(false)
			执行任务.设置登录游戏流程()
			return 执行任务.登录游戏()
		end
		
		if 操作.识别2(标识.战斗结束界面) then
			keepScreen(false)
			return 战斗结束界面.to海国退治界面()
		end
		
		if 操作.识别2(标识.战斗结算界面1) then
			keepScreen(false)
			return 战斗结算界面1.to战斗结算界面2()
		end
		
		if 操作.识别2(标识.战斗结算界面2) then
			keepScreen(false)
			return 战斗结算界面2.to战斗结束界面()	
		end
		
		if 操作.识别2(标识.战斗退出界面) then
			keepScreen(false)
			return 战斗退出界面.退出()	
		end
		
		if 操作.识别2(标识.大江山宝库界面) then
			keepScreen(false)
			return 大江山宝库界面.to大江山之战界面()
		end
		
		if 操作.识别2(标识.源氏藏兵阁界面) then
			keepScreen(false)
			return 源氏藏兵阁界面.to大江山之战界面()
		end
		
		if 操作.识别2(标识.个人突破界面) then
			keepScreen(false)
			操作.点击按钮(按钮.个人突破界面_退出按钮)
			mSleep(888)
			return 探索界面.to庭院界面()
		end
		
		if 操作.识别2(标识.寮突破界面) then
			keepScreen(false)
			操作.点击按钮(按钮.寮突破界面_退出按钮)
			mSleep(888)
			return 探索界面.to庭院界面()
		end
		
		if 操作.识别2(标识.真蛇界面) then
			keepScreen(false)
			return 真蛇界面.to探索界面()
		end
		
		if 操作.识别2(标识.购买体力界面) then
			keepScreen(false)
			return 购买体力界面.操作()
		end
		
		if 操作.识别2(标识.邮箱界面) then
			keepScreen(false)
			操作.点击按钮(按钮.邮箱界面_关闭)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.寮公告界面) then
			keepScreen(false)
			操作.点击按钮(按钮.寮公告界面_确定)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.召唤界面) then
			keepScreen(false)
			操作.点击按钮(按钮.召唤界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.结界界面) then
			keepScreen(false)
			操作.点击按钮(按钮.结界界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end	
		
		if 操作.识别2(标识.buff界面) then
			keepScreen(false)
			操作.点击按钮(按钮.buff界面_退出区域)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.重连) then
			keepScreen(false)
			执行任务.等待重连()
		end
		
		if 操作.识别2(标识.登录动画界面) then
			keepScreen(false)
			mSleep(3000)
			if 操作.识别2(标识.登录动画界面) then
				执行任务.设置登录游戏流程()
				return 执行任务.登录游戏()
			end
		end
		
		if 参数.禁止聊天 then
			if 操作.识别点击(按钮.频道界面_关闭按钮,true) then
				keepScreen(false)
				mSleep(888)
				return 执行任务.重新识别()
			end
		
			if 操作.识别2(标识.聊天界面) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭按钮)
				mSleep(888)
				return 执行任务.重新识别()
			end
			
			if 操作.识别2(标识.聊天界面_好友信息) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭好友信息)
				mSleep(888)
				return 执行任务.重新识别()
			end
		end
		
		if 操作.识别点击(按钮.式神录界面_返回按钮,true) then
			keepScreen(false)
			mSleep(2000)
			return 执行任务.重新识别()
		end
		
		keepScreen(false)
		执行任务.检查闪退()
		mSleep(1000)
	end
	
	
end


-----------离岛之歌------------
function 执行任务.离岛之歌()
	sysLog('重新识别界面中......')
	while true do
		keepScreen(true)
		
		if 操作.识别2(标识.协作界面) then
			keepScreen(false)
			return 协作任务界面.处理()
		end
		
		if 操作.识别2(标识.超鬼王界面) then
			keepScreen(false)
			if 参数.交叉超鬼王 then
				return 执行任务.切换超鬼王()
			else
				操作.点击按钮(按钮.超鬼王界面_退出按钮)
				mSleep(300)
				return 探索界面.to御魂界面()
			end
		end
		
		if 操作.或识别({标识.庭院界面1,标识.庭院界面2},false) then
			keepScreen(false)
			return 庭院界面.to离岛界面()
		end
		
		if 操作.识别2(标识.探索界面) then
			keepScreen(false)
			if 参数.智能开关buff and 参数.调整开关buff~='保持' then
				探索界面.开关buff()
			end
			return 探索界面.to庭院界面()
		end
		
		if 操作.或识别({标识.离岛界面,标识.离岛界面2},false) then
			keepScreen(false)
			return 离岛界面.to道场（居酒屋）界面()
		end
		
		if 操作.识别2(标识.道场（居酒屋）界面) then
			keepScreen(false)
			return 道场（居酒屋）界面.to战斗准备界面()
		end
		
		if 操作.识别2(标识.浮世澡堂界面) then
			keepScreen(false)
			return 浮世澡堂界面.泡澡()
		end
		
		if 操作.识别2(标识.战斗准备界面) then
			keepScreen(false)
			return 战斗准备界面.to战斗界面()
		end
		
		if 操作.识别2(标识.寄养界面) then
			keepScreen(false)
			寄养界面.退出()
		end
		
		if 操作.识别2(标识.战斗界面) then
			keepScreen(false)
			return 战斗界面.to战斗胜利界面()
		end
		
		if 操作.或识别({标识.公告界面,标识.登录界面1},false) then
			keepScreen(false)
			执行任务.设置登录游戏流程()
			return 执行任务.登录游戏()
		end
		
		if 操作.或识别({标识.战斗胜利界面1,标识.战斗胜利界面2,标识.战斗胜利界面3},false) then
			keepScreen(false)
			return 战斗胜利界面.to战斗结算界面2()
		end
		
		if 操作.识别2(标识.战斗失败界面) then
			keepScreen(false)
			return 战斗失败界面.to道场（居酒屋）界面()
		end
		
		if 操作.识别2(标识.战斗结算界面1) then
			keepScreen(false)
			return 战斗结算界面1.to战斗结算界面2()
		end
		
		if 操作.识别2(标识.战斗结算界面2) then
			keepScreen(false)
			return 战斗结算界面2.to道场（居酒屋）界面()	
		end
		
		if 操作.识别2(标识.战斗结算界面2_御魂超出上限) then
			keepScreen(false)
			参数.御魂超出上限=true
			操作.点击按钮(按钮.战斗结算界面2_御魂超出上限确定按钮)
			mSleep(666)
			return 战斗结算界面2.to道场（居酒屋）界面()
		end
		
		if 操作.识别2(标识.战斗结算界面3) then
			keepScreen(false)
			return 战斗结算界面3.to道场（居酒屋）界面()
		end
		
		if 参数.交叉离岛 then
			if 操作.识别2(标识.房间界面) then
				keepScreen(false)
				参数.cnt=8
				return 房间界面.to探索界面()
			end
			
			if 操作.识别2(标识.创建队伍界面) then
				keepScreen(false)
				return 创建队伍界面.to组队界面()
			end
			 
			if 操作.识别2(标识.组队界面) then
				keepScreen(false)
				if 参数.任务=='大蛇' then
					return 组队界面.to大蛇界面()
				elseif 参数.任务=='觉醒' then
					return 组队界面.to麒麟界面()
				else
					return 组队界面.to庭院界面()
				end
			end
			
			if 操作.识别2(标识.大蛇界面) then
				keepScreen(false)
				return 大蛇界面.to探索界面()
			end
			
			if 操作.或识别({标识.麒麟界面1,标识.麒麟界面2},false) then
				keepScreen(false)
				return 麒麟界面.to探索界面()
			end
			
			if 操作.识别2(标识.业原火界面) then
				keepScreen(false)
				return 业原火界面.to探索界面()
			end
			
			if 操作.识别2(标识.神兽界面) then
				keepScreen(false)
				return 神兽界面.to探索界面()
			end
			
			if 操作.识别2(标识.大江山之战界面) then
				keepScreen(false)
				return 大江山之战界面.to庭院界面()
			end
			
			if 操作.识别2(标识.修罗战场界面) then
				keepScreen(false)
				return 修罗战场界面.to大江山之战界面()
			end
			
		end
		
		if 操作.识别2(标识.个人突破界面) then
			keepScreen(false)
			操作.点击按钮(按钮.个人突破界面_退出按钮)
			mSleep(888)
			return 探索界面.to庭院界面()
		end
		
		if 操作.识别2(标识.寮突破界面) then
			keepScreen(false)
			操作.点击按钮(按钮.寮突破界面_退出按钮)
			mSleep(888)
			return 探索界面.to庭院界面()
		end
		
		if 操作.识别2(标识.真蛇界面) then
			keepScreen(false)
			return 真蛇界面.to探索界面()
		end
		
		if 操作.识别2(标识.购买体力界面) then
			keepScreen(false)
			return 购买体力界面.操作()
		end
		
		if 操作.识别2(标识.邮箱界面) then
			keepScreen(false)
			操作.点击按钮(按钮.邮箱界面_关闭)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.寮公告界面) then
			keepScreen(false)
			操作.点击按钮(按钮.寮公告界面_确定)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.召唤界面) then
			keepScreen(false)
			操作.点击按钮(按钮.召唤界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.结界界面) then
			keepScreen(false)
			操作.点击按钮(按钮.结界界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end	
		
		if 操作.识别2(标识.buff界面) then
			keepScreen(false)
			操作.点击按钮(按钮.buff界面_退出区域)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.重连) then
			keepScreen(false)
			执行任务.等待重连()
		end
		
		if 操作.识别2(标识.登录动画界面) then
			keepScreen(false)
			mSleep(3000)
			if 操作.识别2(标识.登录动画界面) then
				执行任务.设置登录游戏流程()
				return 执行任务.登录游戏()
			end
		end
		
		if 参数.禁止聊天 then
			if 操作.识别点击(按钮.频道界面_关闭按钮,true) then
				keepScreen(false)
				mSleep(888)
				return 执行任务.重新识别()
			end
		
			if 操作.识别2(标识.聊天界面) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭按钮)
				mSleep(888)
				return 执行任务.重新识别()
			end
			
			if 操作.识别2(标识.聊天界面_好友信息) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭好友信息)
				mSleep(888)
				return 执行任务.重新识别()
			end
		end
		
		if 操作.识别点击(按钮.式神录界面_返回按钮,true) then
			keepScreen(false)
			mSleep(2000)
			return 执行任务.重新识别()
		end
		
		keepScreen(false)
		执行任务.检查闪退()
		mSleep(1000)
	end
	
	
end


-----------轮回秘境------------
function 执行任务.轮回秘境()
	sysLog('重新识别界面中......')
	while true do
		keepScreen(true)
		
		if 操作.识别2(标识.协作界面) then
			keepScreen(false)
			return 协作任务界面.处理()
		end
		
		if 操作.识别2(标识.超鬼王界面) then
			keepScreen(false)
			if 参数.交叉超鬼王 then
				return 执行任务.切换超鬼王()
			else
				操作.点击按钮(按钮.超鬼王界面_退出按钮)
				mSleep(300)
				return 探索界面.to御魂界面()
			end
		end
		
		if 操作.或识别({标识.庭院界面1,标识.庭院界面2},false) then
			keepScreen(false)
			return 庭院界面.to瞭望塔界面()
		end
		
		if 操作.识别2(标识.探索界面) then
			keepScreen(false)
			if 参数.智能开关buff and 参数.调整开关buff~='保持' then
				探索界面.开关buff()
			end
			return 探索界面.to庭院界面()
		end
		
		if 操作.识别2(标识.瞭望塔界面) then
			keepScreen(false)
			return 瞭望塔界面.to轮回秘境界面()
		end
		
		if 操作.识别2(标识.轮回秘境界面) then
			keepScreen(false)
			return 轮回秘境界面.to轮回秘境准备界面()
		end
		
		if 操作.识别2(标识.轮回秘境下一层确认界面) then
			keepScreen(false)
			return 轮回秘境下一层确认界面.to轮回秘境选择资源界面()
		end
		
		if 操作.识别2(标识.轮回秘境选择资源界面) then
			keepScreen(false)
			return 轮回秘境选择资源界面.to轮回秘境界面()
		end
		
		if 操作.识别2(标识.轮回秘境准备界面) then
			keepScreen(false)
			return 轮回秘境准备界面.to战斗准备界面()
		end
		
		if 操作.识别2(标识.战斗准备界面) then
			keepScreen(false)
			return 战斗准备界面.to战斗界面()
		end
		
		if 操作.识别2(标识.寄养界面) then
			keepScreen(false)
			寄养界面.退出()
		end
		
		if 操作.识别2(标识.战斗界面) then
			keepScreen(false)
			return 战斗界面.to战斗胜利界面()
		end
		
		if 操作.或识别({标识.公告界面,标识.登录界面1},false) then
			keepScreen(false)
			执行任务.设置登录游戏流程()
			return 执行任务.登录游戏()
		end
		
		if 操作.或识别({标识.战斗胜利界面1,标识.战斗胜利界面2,标识.战斗胜利界面3},false) then
			keepScreen(false)
			return 战斗胜利界面.to战斗结算界面2()
		end
		
		if 操作.识别2(标识.战斗失败界面) then
			keepScreen(false)
			return 战斗失败界面.to轮回秘境界面()
		end
		
		if 操作.识别2(标识.战斗结算界面1) then
			keepScreen(false)
			return 战斗结算界面1.to战斗结算界面2()
		end
		
		if 操作.识别2(标识.战斗结算界面2) then
			keepScreen(false)
			return 战斗结算界面2.to轮回秘境界面()	
		end
		
		if 操作.识别2(标识.战斗结算界面2_御魂超出上限) then
			keepScreen(false)
			参数.御魂超出上限=true
			操作.点击按钮(按钮.战斗结算界面2_御魂超出上限确定按钮)
			mSleep(666)
			return 战斗结算界面2.to轮回秘境界面()
		end
		
		if 操作.识别2(标识.战斗结算界面3) then
			keepScreen(false)
			return 战斗结算界面3.to轮回秘境界面()
		end
		
		if 操作.识别2(标识.个人突破界面) then
			keepScreen(false)
			操作.点击按钮(按钮.个人突破界面_退出按钮)
			mSleep(888)
			return 探索界面.to庭院界面()
		end
		
		if 操作.识别2(标识.寮突破界面) then
			keepScreen(false)
			操作.点击按钮(按钮.寮突破界面_退出按钮)
			mSleep(888)
			return 探索界面.to庭院界面()
		end
		
		if 操作.识别2(标识.真蛇界面) then
			keepScreen(false)
			return 真蛇界面.to探索界面()
		end
		
		if 操作.识别2(标识.购买体力界面) then
			keepScreen(false)
			return 购买体力界面.操作()
		end
		
		if 操作.识别2(标识.邮箱界面) then
			keepScreen(false)
			操作.点击按钮(按钮.邮箱界面_关闭)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.寮公告界面) then
			keepScreen(false)
			操作.点击按钮(按钮.寮公告界面_确定)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.召唤界面) then
			keepScreen(false)
			操作.点击按钮(按钮.召唤界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.结界界面) then
			keepScreen(false)
			操作.点击按钮(按钮.结界界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end	
		
		if 操作.识别2(标识.buff界面) then
			keepScreen(false)
			操作.点击按钮(按钮.buff界面_退出区域)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.重连) then
			keepScreen(false)
			执行任务.等待重连()
		end
		
		if 操作.识别2(标识.登录动画界面) then
			keepScreen(false)
			mSleep(3000)
			if 操作.识别2(标识.登录动画界面) then
				执行任务.设置登录游戏流程()
				return 执行任务.登录游戏()
			end
		end
		
		if 参数.禁止聊天 then
			if 操作.识别点击(按钮.频道界面_关闭按钮,true) then
				keepScreen(false)
				mSleep(888)
				return 执行任务.重新识别()
			end
		
			if 操作.识别2(标识.聊天界面) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭按钮)
				mSleep(888)
				return 执行任务.重新识别()
			end
			
			if 操作.识别2(标识.聊天界面_好友信息) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭好友信息)
				mSleep(888)
				return 执行任务.重新识别()
			end
		end
		
		if 操作.识别点击(按钮.式神录界面_返回按钮,true) then
			keepScreen(false)
			mSleep(2000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.溯玉耗尽) then
			keepScreen(false)
			if 参数.提示信息 then
				syslog2("溯玉不足！");
			end
			for var = 1,2 do
				vibrator()
				mSleep(1000)
			end
			lua_exit()
		end
		
		keepScreen(false)
		执行任务.检查闪退()
		mSleep(1000)
	end
	
	
end


-----------狗粮升星------------
function 执行任务.狗粮升星()
	sysLog('重新识别界面中......')
	while true do
		keepScreen(true)
		
		if 操作.识别2(标识.协作界面) then
			keepScreen(false)
			return 协作任务界面.处理()
		end
		
		if 操作.识别2(标识.超鬼王界面) then
			keepScreen(false)
			if 参数.交叉超鬼王 then
				return 执行任务.切换超鬼王()
			else
				操作.点击按钮(按钮.超鬼王界面_退出按钮)
				mSleep(300)
				return 探索界面.to御魂界面()
			end
		end
		
		if 操作.或识别({标识.庭院界面1,标识.庭院界面2},false) then
			keepScreen(false)
			return 庭院界面.to式神录界面()
		end
		
		if 操作.识别2(标识.探索界面) then
			keepScreen(false)
			if 参数.智能开关buff and 参数.调整开关buff~='保持' then
				探索界面.开关buff()
			end
			return 探索界面.to庭院界面()
		end
		
		if 操作.识别2(标识.式神录界面) then
			keepScreen(false)
			return 式神录界面.to育成界面()
		end
		
		if not 参数.狗粮升星_继续升星 then
			if 操作.或识别({标识.狗粮升星界面,标识.狗粮升级界面}, false) then
				keepScreen(false)
				return 育成界面.to式神录界面()
			end
			
			if 操作.识别2(标识.星级提升界面) then
				keepScreen(false)
				return 星级提升界面.to式神录界面()
			end
		else
			if 操作.或识别({标识.狗粮升星界面,标识.狗粮升级界面}, false) then
				keepScreen(false)
				return 育成界面.to星级提升界面()
			end
			
			if 操作.识别2(标识.星级提升界面) then
				keepScreen(false)
				return 星级提升界面.to育成界面()
			end
		end
		
		if 操作.识别2(标识.技能升级提示) then
			keepScreen(false)
			操作.点击按钮(按钮.技能升级提示_确认)
			mSleep(888)
			return 式神录界面.to育成界面()
		end
		
		
		if 操作.识别2(标识.寄养界面) then
			keepScreen(false)
			寄养界面.退出()
		end
		
		if 操作.或识别({标识.公告界面,标识.登录界面1},false) then
			keepScreen(false)
			执行任务.设置登录游戏流程()
			return 执行任务.登录游戏()
		end
		
		if 操作.识别2(标识.邮箱界面) then
			keepScreen(false)
			操作.点击按钮(按钮.邮箱界面_关闭)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.寮公告界面) then
			keepScreen(false)
			操作.点击按钮(按钮.寮公告界面_确定)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.召唤界面) then
			keepScreen(false)
			操作.点击按钮(按钮.召唤界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.结界界面) then
			keepScreen(false)
			操作.点击按钮(按钮.结界界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end	
		
		if 操作.识别2(标识.buff界面) then
			keepScreen(false)
			操作.点击按钮(按钮.buff界面_退出区域)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.重连) then
			keepScreen(false)
			执行任务.等待重连()
		end
		
		if 操作.识别2(标识.登录动画界面) then
			keepScreen(false)
			mSleep(3000)
			if 操作.识别2(标识.登录动画界面) then
				执行任务.设置登录游戏流程()
				return 执行任务.登录游戏()
			end
		end
		
		if 参数.禁止聊天 then
			if 操作.识别点击(按钮.频道界面_关闭按钮,true) then
				keepScreen(false)
				mSleep(888)
				return 执行任务.重新识别()
			end
		
			if 操作.识别2(标识.聊天界面) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭按钮)
				mSleep(888)
				return 执行任务.重新识别()
			end
			
			if 操作.识别2(标识.聊天界面_好友信息) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭好友信息)
				mSleep(888)
				return 执行任务.重新识别()
			end
		end
		
		keepScreen(false)
		执行任务.检查闪退()
		mSleep(1000)
	end
	
	
end


------------抽厕纸-------------
function 执行任务.抽厕纸()
	sysLog('重新识别界面中......')
	while true do
		keepScreen(true)
		
		if 操作.识别2(标识.协作界面) then
			keepScreen(false)
			return 协作任务界面.处理()
		end
		
		if 操作.识别2(标识.超鬼王界面) then
			keepScreen(false)
			if 参数.交叉超鬼王 then
				return 执行任务.切换超鬼王()
			else
				操作.点击按钮(按钮.超鬼王界面_退出按钮)
				mSleep(300)
				return 探索界面.to御魂界面()
			end
		end
		
		if 操作.或识别({标识.庭院界面1,标识.庭院界面2},false) then
			keepScreen(false)
			return 庭院界面.to召唤界面()
		end
		
		if 操作.识别2(标识.探索界面) then
			keepScreen(false)
			if 参数.智能开关buff and 参数.调整开关buff~='保持' then
				探索界面.开关buff()
			end
			return 探索界面.to庭院界面()
		end
		
		if 操作.识别2(标识.抽N卡界面) and not 操作.识别2(标识.抽N卡完成界面) then
			keepScreen(false)
			return 抽N卡界面.to抽N卡完成界面()
		end
		
		if 操作.识别2(标识.抽N卡完成界面) then
			keepScreen(false)
			return 抽N卡完成界面.to抽N卡界面()
		end
		
		if 操作.识别2(标识.召唤界面) then
			keepScreen(false)
			return 召唤界面.to抽N卡界面()
		end
		
		if 操作.识别2(标识.召唤准备界面) then
			keepScreen(false)
			return 召唤准备界面.to召唤界面()
		end
		
		if 操作.识别2(标识.寄养界面) then
			keepScreen(false)
			寄养界面.退出()
		end
		
		if 操作.或识别({标识.公告界面,标识.登录界面1},false) then
			keepScreen(false)
			执行任务.设置登录游戏流程()
			return 执行任务.登录游戏()
		end
		
		if 操作.识别2(标识.邮箱界面) then
			keepScreen(false)
			操作.点击按钮(按钮.邮箱界面_关闭)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.寮公告界面) then
			keepScreen(false)
			操作.点击按钮(按钮.寮公告界面_确定)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.结界界面) then
			keepScreen(false)
			操作.点击按钮(按钮.结界界面_返回)
			mSleep(3000)
			return 执行任务.重新识别()
		end	
		
		if 操作.识别2(标识.buff界面) then
			keepScreen(false)
			操作.点击按钮(按钮.buff界面_退出区域)
			mSleep(1000)
			return 执行任务.重新识别()
		end
		
		if 操作.识别2(标识.重连) then
			keepScreen(false)
			执行任务.等待重连()
		end
		
		if 操作.识别2(标识.登录动画界面) then
			keepScreen(false)
			mSleep(3000)
			if 操作.识别2(标识.登录动画界面) then
				执行任务.设置登录游戏流程()
				return 执行任务.登录游戏()
			end
		end
		
		if 参数.禁止聊天 then
			if 操作.识别点击(按钮.频道界面_关闭按钮,true) then
				keepScreen(false)
				mSleep(888)
				return 执行任务.重新识别()
			end
		
			if 操作.识别2(标识.聊天界面) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭按钮)
				mSleep(888)
				return 执行任务.重新识别()
			end
			
			if 操作.识别2(标识.聊天界面_好友信息) then
				keepScreen(false)
				操作.点击按钮(按钮.聊天界面_关闭好友信息)
				mSleep(888)
				return 执行任务.重新识别()
			end
		end
		
		keepScreen(false)
		执行任务.检查闪退()
		mSleep(1000)
	end
end


-------------------------------


