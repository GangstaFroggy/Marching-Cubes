extends Resource
class_name Terrain

@export var continent_noise : Noise
@export var cavern_noise : Noise
@export var squish_noise : Noise
@export var continent_noise_limit : float
@export var continentalness : float

func get_value(position : Vector3) -> float:
	var continent_value = clamp(continent_noise.get_noise_2d(position.x, position.z), -continent_noise_limit, continent_noise_limit) * continentalness - position.y
	var cavern_value = cavern_noise.get_noise_3dv(position) * ((squish_noise.get_noise_2d(position.x, position.z) + 1)/2)
	
	return cavern_value + continent_value * 0.025
	
