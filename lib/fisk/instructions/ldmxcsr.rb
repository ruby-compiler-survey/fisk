# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction LDMXCSR
    forms = []
    operands = [
        OPERAND_TYPES[14],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_rex(buffer, operands,
              false,
              0,
              0,
              operands[0].rex_value,
              operands[0].rex_value) +
          add_opcode(buffer, 0x0F, 0) +
          add_opcode(buffer, 0xAE, 0) +
          add_modrm(buffer,
              0,
              2,
              operands[0].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # ldmxcsr: m32
    forms << Form.new(operands, encodings)
    LDMXCSR = Instruction.new("LDMXCSR", forms)
  end
end
