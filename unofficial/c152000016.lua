--ストームアクセス
--Storm Access
--Scripted by The Razgriz
local s,id=GetID()
function s.initial_effect(c)
	--skill
	aux.AddVrainsSkillProcedure(c,s.flipcon,s.flipop)
end
function s.flipcon(e,tp,eg,ep,ev,re,r,rp)
	--opd check
	if Duel.GetFlagEffect(tp,id)>0 then return false end
	--condition
	return Duel.GetLP(tp)<=1000
end
function s.flipop(e,tp,eg,ep,ev,re,r,rp)
	--opd Register
	Duel.RegisterFlagEffect(tp,id,0,0,0)
	Duel.Hint(HINT_SKILL_FLIP,tp,id|(1<<32))
	Duel.Hint(HINT_CARD,tp,id)
	--check if skill is negated
	if aux.CheckSkillNegation(e,tp) then return end
	--Add random Cyberse Link monster
	local cytab={511027009,86066372,21887175,511030028,511030011,511030030,511030072,511030026,511030027,511030016,511030015,511030073,53413628,511600365,01861629,06622715,15844566,30822527,33897356,40669071,46947713,61245672,511600080,511600110,45462149,96380700,511600056,511600365,511027001,511106014,511009717,511106013,511027010,511009711,511009713,511009714,511600223,13536606,77637979,24842059,511009954,31313405,511600280,41463181,87871125,14812471,60303245,04478086,97677329,41248270,11738489,511600300,13452889,60279710,24882256,511600299,97383507,24487411,511600301,48068378,32995276,511600357,85243784,02220237,511310034,511600215,52698008,11674673,511600091,511600055,511600042,05329790,511600355,59859086,49847524,04914353,67231737,76232522,34472920,511600106,88093706,89238128,68934651,88000953,72336818,511030065,22862454,12450071,05043010,99111753,05821478,22593417,51109735,66403530,72529749,38502358,52615248,511018035,51160220,511009429,511600225,32617464,66226132,65741786,04709881,39752820,63503850,45002991,77058170,30691817,511600252,43735670,511600260,67712104,511600253,79130389,511600254,05524387,511600267,94207108,47910940,57282724,98978921,80088625,79016563,511600112,511600113,511009930,511600231,511445000,511009928}
	local storm=cytab[Duel.GetRandomNumber(1,#cytab)]   
	local tc=Duel.CreateToken(tp,storm)
	if tc:IsAbleToDeck() then
		Duel.SendtoDeck(tc,tp,0,REASON_EFFECT)
	end
end