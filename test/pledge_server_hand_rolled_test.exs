defmodule PledgeServerHandRolledTest do
  use ExUnit.Case
  alias Servy.PledgeServerHandRolled

  test "caches the 3 most recent pledges and totals their amounts" do
    PledgeServerHandRolled.start()

    PledgeServerHandRolled.create_pledge("larry", 10)
    PledgeServerHandRolled.create_pledge("moe",   20)
    PledgeServerHandRolled.create_pledge("curly", 30)
    PledgeServerHandRolled.create_pledge("daisy", 40)
    PledgeServerHandRolled.create_pledge("grace", 50)

    most_recent_pledges = [{"grace", 50}, {"daisy", 40}, {"curly", 30}]

    assert PledgeServerHandRolled.recent_pledges() == most_recent_pledges
    assert PledgeServerHandRolled.total_pledged() == 120
  end
end
