import FlowIDTableStaking from 0x8624b52f9ddcd04a

  access(all) fun main(): Bool {
      return FlowIDTableStaking.isLowercaseHex("abcd1234AABB")
  }