const hyprland = await Service.import("hyprland")

const dispatch = ws => hyprland.messageAsync(`dispatch workspace ${ws}`);
const wsSymbols = ["壹", "貳", "叁", "肆", "伍", "陸", "柒", "捌", "玖", "拾"]
const Workspaces = () => Widget.EventBox({
  onScrollUp: () => dispatch('+1'),
  onScrollDown: () => dispatch('-1'),
  child: Widget.Box({
    children: Array.from({ length: 10 }, (_, i) => i + 1).map(i => Widget.Button({
      attribute: i,
      label: `${wsSymbols[i-1]}`,
      onClicked: () => dispatch(i),

      class_name: i === hyprland.active.workspace.id ? "focused" : ""
    })),

    // remove this setup hook if you want fixed number of buttons
    setup: self => self.hook(hyprland, () => self.children.forEach(btn => {
      btn.visible = hyprland.workspaces.some(ws => ws.id === btn.attribute);
    })),
  }),
})
export { Workspaces };
