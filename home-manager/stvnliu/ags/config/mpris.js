const mpris = await Service.import('mpris')

/** 
 * @param {import('types/service/mpris').MprisPlayer} player 
 * */
const Player = (player, count) => Widget.Button({
  onClicked: () => player.playPause(),
  child: Widget.Label().hook(player, label => {
    const { track_artists, track_title } = player;
    label.label = `${count} PLAYING`;
  }),
})

export const players = Widget.Box({
  children: mpris.bind('players').as(p => p.map(
    (this_player, index, array) => { return Player(this_player, array.length) }))
})
