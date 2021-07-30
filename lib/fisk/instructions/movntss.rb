# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction MOVNTSS
    forms = []
    operands = [
        OPERAND_TYPES[37],
        OPERAND_TYPES[24],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_prefix(buffer, operands, 0xF3, true) +
          add_rex(buffer, operands,
              false,
              0,
              operands[1].rex_value,
              operands[0].rex_value,
              operands[0].rex_value) +
          add_opcode(buffer, 0x0F, 0) +
          add_opcode(buffer, 0x2B, 0) +
          add_modrm(buffer,
              0,
              operands[1].op_value,
              operands[0].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # movntss: m32, xmm
    forms << Form.new(operands, encodings)
    MOVNTSS = Instruction.new("MOVNTSS", forms)
  end
end
