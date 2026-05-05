import { Gtk } from "ags/gtk4"
import { createPoll } from "ags/time"

export default function() {
  const time = createPoll("", 1000, `bash -c "date '+%d %b %R'"`)
  
  return (
    <menubutton $type="end" hexpand halign={Gtk.Align.CENTER}>
      <label label={time} />

      <popover>
        <Gtk.Calendar />
      </popover>
    </menubutton>
  )
}
