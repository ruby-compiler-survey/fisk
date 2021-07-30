# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction VPMOVM2B
    forms = []
    operands = [
        OPERAND_TYPES[26],
        OPERAND_TYPES[42],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_EVEX(buffer, operands)
          add_opcode(buffer, 0x28, 0) +
          add_modrm(buffer,
              3,
              operands[0].op_value,
              operands[1].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # vpmovm2b: xmm, k
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[65],
        OPERAND_TYPES[42],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_EVEX(buffer, operands)
          add_opcode(buffer, 0x28, 0) +
          add_modrm(buffer,
              3,
              operands[0].op_value,
              operands[1].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # vpmovm2b: ymm, k
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[97],
        OPERAND_TYPES[42],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_EVEX(buffer, operands)
          add_opcode(buffer, 0x28, 0) +
          add_modrm(buffer,
              3,
              operands[0].op_value,
              operands[1].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # vpmovm2b: zmm, k
    forms << Form.new(operands, encodings)
    VPMOVM2B = Instruction.new("VPMOVM2B", forms)
  end
end
