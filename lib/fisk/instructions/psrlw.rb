# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction PSRLW: Shift Packed Word Data Right Logical
    PSRLW = Instruction.new("PSRLW", [
    # psrlw: mm, imm8
      Form.new([
        OPERAND_TYPES[54],
        OPERAND_TYPES[1],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_rex(buffer, operands,
              false,
              0,
              0,
              0,
              operands[0].rex_value) +
            add_opcode(buffer, 0x0F, 0) +
            add_opcode(buffer, 0x71, 0) +
            add_modrm(buffer,
              3,
              2,
              operands[0].op_value, operands) +
            add_immediate(buffer, operands[1].op_value, 1) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # psrlw: mm, mm
      Form.new([
        OPERAND_TYPES[54],
        OPERAND_TYPES[36],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_rex(buffer, operands,
              false,
              0,
              operands[0].rex_value,
              0,
              operands[1].rex_value) +
            add_opcode(buffer, 0x0F, 0) +
            add_opcode(buffer, 0xD1, 0) +
            add_modrm(buffer,
              3,
              operands[0].op_value,
              operands[1].op_value, operands) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # psrlw: mm, m64
      Form.new([
        OPERAND_TYPES[54],
        OPERAND_TYPES[18],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_rex(buffer, operands,
              false,
              0,
              operands[0].rex_value,
              operands[1].rex_value,
              operands[1].rex_value) +
            add_opcode(buffer, 0x0F, 0) +
            add_opcode(buffer, 0xD1, 0) +
            add_modrm(buffer,
              0,
              operands[0].op_value,
              operands[1].op_value, operands) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # psrlw: xmm, imm8
      Form.new([
        OPERAND_TYPES[23],
        OPERAND_TYPES[1],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_prefix(buffer, operands, 0x66, true) +
            add_rex(buffer, operands,
              false,
              0,
              0,
              0,
              operands[0].rex_value) +
            add_opcode(buffer, 0x0F, 0) +
            add_opcode(buffer, 0x71, 0) +
            add_modrm(buffer,
              3,
              2,
              operands[0].op_value, operands) +
            add_immediate(buffer, operands[1].op_value, 1) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # psrlw: xmm, xmm
      Form.new([
        OPERAND_TYPES[23],
        OPERAND_TYPES[24],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_prefix(buffer, operands, 0x66, true) +
            add_rex(buffer, operands,
              false,
              0,
              operands[0].rex_value,
              0,
              operands[1].rex_value) +
            add_opcode(buffer, 0x0F, 0) +
            add_opcode(buffer, 0xD1, 0) +
            add_modrm(buffer,
              3,
              operands[0].op_value,
              operands[1].op_value, operands) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # psrlw: xmm, m128
      Form.new([
        OPERAND_TYPES[23],
        OPERAND_TYPES[25],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_prefix(buffer, operands, 0x66, true) +
            add_rex(buffer, operands,
              false,
              0,
              operands[0].rex_value,
              operands[1].rex_value,
              operands[1].rex_value) +
            add_opcode(buffer, 0x0F, 0) +
            add_opcode(buffer, 0xD1, 0) +
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
