# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction KORTESTQ: OR 64-bit Masks and Set Flags
    KORTESTQ = Instruction.new("KORTESTQ", [
    # kortestq: k, k
      Form.new([
        OPERAND_TYPES[42],
        OPERAND_TYPES[42],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_VEX(buffer, operands)
            add_opcode(buffer, 0x98, 0) +
            add_modrm(buffer,
              3,
              operands[0].op_value,
              operands[1].op_value, operands) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    ].freeze).freeze
  end
end
