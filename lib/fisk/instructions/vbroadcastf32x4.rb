# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction VBROADCASTF32X4: Broadcast Four Single-Precision Floating-Point Elements
    VBROADCASTF32X4 = Instruction.new("VBROADCASTF32X4", [
    # vbroadcastf32x4: ymm{k}{z}, m128
      Form.new([
        OPERAND_TYPES[59],
        OPERAND_TYPES[25],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_EVEX(buffer, operands)
            add_opcode(buffer, 0x1A, 0) +
            add_modrm(buffer,
              0,
              operands[0].op_value,
              operands[1].op_value, operands) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # vbroadcastf32x4: zmm{k}{z}, m128
      Form.new([
        OPERAND_TYPES[62],
        OPERAND_TYPES[25],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_EVEX(buffer, operands)
            add_opcode(buffer, 0x1A, 0) +
            add_modrm(buffer,
              0,
              operands[0].op_value,
              operands[1].op_value, operands) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    ].freeze).freeze
  end
end
