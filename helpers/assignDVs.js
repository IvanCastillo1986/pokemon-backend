const randomNum = (minVal, maxVal) => {
    // NOTE: maxVal is exclusive. So whichever maxVal you'd like to include, add 1 to argument
    return Math.floor(Math.random() * (maxVal - minVal) + minVal)
}
const assignHpDV = (atk_dv, def_dv) => {
    return (atk_dv % 8) * 2 + (def_dv % 8)
}
const assignDVs = (pokemon) => {
    // [dv.deckId, dv.hpDV, dv.atkDV, dv.defDV, dv.special_atkDV, dv.special_defDV, dv.speedDV]
    // returns DVs object with random DV values from 0-15
    const pokemonDVs = {
        deckId: pokemon.id,
        atk_dv: randomNum(0, 16),
        def_dv: randomNum(0, 16),
        special_atk_dv: randomNum(0, 16),
        special_def_dv: randomNum(0, 16),
        speed_dv: randomNum(0, 16)
    }
    pokemonDVs.hp_dv = assignHpDV(pokemonDVs.atk_dv, pokemonDVs.def_dv)
    
    return pokemonDVs
}


const raiseStat = (baseStat, dv, level) => {
    const raisedStat = Math.ceil((2 * baseStat + dv) * level / 100 + 5)
    return raisedStat
}
// This gets called upon refresh, because it uses persisted DVs that will not changed.
// To implement this function, first call the DVs for corresponding decks from database.
const calculateRaisedStats = (pokemon, dvs) => {
    /*
        The original formula is:
        Stat = (2 * BaseStat + DV + StatExp) * Level / 100 + 5
        BUT let's do it without StatExp for now. We can add this later if anything:
        Stat = (2 * BaseStat + DV) * Level / 100 + 5
    */
    pokemon.hp = raiseStat(pokemon.hp, dvs.hp_dv, pokemon.lvl)
    pokemon.atk = raiseStat(pokemon.atk, dvs.atk_dv, pokemon.lvl)
    pokemon.def = raiseStat(pokemon.def, dvs.def_dv, pokemon.lvl)
    pokemon.special_atk = raiseStat(pokemon.special_atk, dvs.special_atk_dv, pokemon.lvl)
    pokemon.special_def = raiseStat(pokemon.special_def, dvs.special_def_dv, pokemon.lvl)
    pokemon.speed = raiseStat(pokemon.speed, dvs.speed_dv, pokemon.lvl)
}


function raisePokemonStats(deck, pokemonDVs) {
    // console.log('raisePokemonStats deck', deck)
    // console.log('raisePokemonStats pokemonDVs', pokemonDVs)
    deck.forEach((pokemon) => {
        const matchingDvObj = pokemonDVs.find(dvObj => dvObj.deck_id === pokemon.id)
        calculateRaisedStats(pokemon, matchingDvObj)
    })

    return deck
}


module.exports = { assignDVs, raisePokemonStats }