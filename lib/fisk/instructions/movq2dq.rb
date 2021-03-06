# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction MOVQ2DQ: Move Quadword from MMX Technology to XMM Register
    MOVQ2DQ = Instruction.new("MOVQ2DQ", [
    # movq2dq: xmm, mm
      Form.new([
        OPERAND_TYPES[26],
        OPERAND_TYPES[36],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_prefix(buffer, operands, 0xF3, true) +
            add_rex(buffer, operands,
              false,
              0,
              operands[0].rex_value,
              0,
              operands[1].rex_value) +
            add_opcode(buffer, 0x0F, 0) +
            add_opcode(buffer, 0xD6, 0) +
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
