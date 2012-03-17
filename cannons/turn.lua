dturn = "<--"
hturn = ""

function getTurn()
	if dturn == "<--" then return 1
	elseif hturn == "<--" then return 2
	end
end

function changeTurn()
	if dturn == "<--" then
		dturn = ""
		hturn = "<--"
	elseif hturn == "<--" then
		dturn = "<--"
		hturn = ""
	end
end