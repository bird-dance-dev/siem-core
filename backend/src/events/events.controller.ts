import { Controller, Get, Post, Body, Param, Query } from '@nestjs/common';
import { ApiTags, ApiOperation, ApiResponse } from '@nestjs/swagger';
import { CreateEventDto } from './dto/create-event.dto.js';
import { BulkCreateEventDto } from './dto/bulk-create-event.dto.js';
import { SearchEventDto } from './dto/search-event.dto.js';

@ApiTags('Events')
@Controller('events')
export class EventsController {
  @Post()
  @ApiOperation({ summary: 'イベント1件登録', description: '監査ログイベントを1件登録する' })
  @ApiResponse({ status: 201, description: '登録成功' })
  create(@Body() createEventDto: CreateEventDto) {
    // TODO: EventsServiceで実装
    return { message: 'Event created' };
  }

  @Post('bulk')
  @ApiOperation({ summary: 'イベント一括登録', description: '監査ログイベントを一括登録する' })
  @ApiResponse({ status: 201, description: '登録成功' })
  createBulk(@Body() bulkCreateEventDto: BulkCreateEventDto) {
    // TODO: EventsServiceで実装
    return { message: 'Events created' };
  }

  @Get()
  @ApiOperation({ summary: 'イベント検索', description: 'UDMフィールドのfilter条件でイベントを検索する' })
  @ApiResponse({ status: 200, description: '検索成功' })
  search(@Query() searchEventDto: SearchEventDto) {
    // TODO: EventsServiceで実装
    return { data: [], total: 0, page: 1, limit: 50 };
  }

  @Get(':id')
  @ApiOperation({ summary: 'イベント詳細取得', description: '指定IDのイベントをsecurityResults含めて取得する' })
  @ApiResponse({ status: 200, description: '取得成功' })
  @ApiResponse({ status: 404, description: 'イベントが見つからない' })
  findOne(@Param('id') id: string) {
    // TODO: EventsServiceで実装
    return { message: `Event ${id}` };
  }
}
