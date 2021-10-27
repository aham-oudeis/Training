# advice.rb


class Advice
	def initialize
		@advice = [ "Kill your darlings", 
								"If equal affection cannot be, let the more loving one be me.",
								"If you find Buddha on the way, kill him.",
								"Drop the begging bowl",
								"I have found the paradox, that if you love till it hurts, then there can be no more hurt, only love.",
								"Love all, trust a few, do wrong to none.",
								"Nothing will work unless you do."
							]
	end

	def generate
		@advice.sample
	end
end